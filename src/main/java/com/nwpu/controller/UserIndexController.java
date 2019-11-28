package com.nwpu.controller;

import com.nwpu.domain.*;
import com.nwpu.pojo.DeliverListBean;
import com.nwpu.pojo.PageBean;
import com.nwpu.service.AccountService;
import com.nwpu.service.CompanyService;
import com.nwpu.service.JobService;
import com.nwpu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class UserIndexController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private JobService jobService;
    @Autowired
    UserService userService;

    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model){

        List<Map<String, Integer>> maps = companyService.findBaseInfo();
        System.out.println(maps.toString());
        model.addAttribute("companies", maps);

        return "user/index";
    }

    /**
     * 我的简历
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/resume")
    public String getResume(HttpSession session, Model model,
                            @RequestParam(value = "msg", defaultValue = "") String msg){
        //HashMap map = new HashMap<>();
        User user = (User)session.getAttribute("user");
        Resume resume = userService.findResumeById(user.getId());
        int resumeId = resume.getId();
        List<Advantage> advantages = userService.findAdvantageByResumeId(resumeId);
        List<String> jobNames = userService.findJobByResumeId(resumeId);
        List<Project> projects = userService.findProjectByResumeId(resumeId);
        List<Honor> honors = userService.findHonorByResumeId(resumeId);
        List<SocialWork> socialWorks = userService.findSocialWorkByResumeId(resumeId);
        model.addAttribute("resume", resume);
        model.addAttribute("advantages", advantages);
        model.addAttribute("jobNames", jobNames);
        model.addAttribute("projects", projects);
        model.addAttribute("honors", honors);
        model.addAttribute("socialWorks", socialWorks);
        if(msg != ""){
            model.addAttribute("msg", msg);
        }
        System.out.println(msg);
        return "user/resume";
    }

    /**
     * 个人基本信息
     * @param session
     * @param model
     * @return
     */
    @GetMapping(value = "/personInfo")
    public String personInfo(HttpSession session, Model model){

        User user = (User)session.getAttribute("user");
        Resume resume = userService.findResumeById(user.getId());
        model.addAttribute("resume", resume);
        //修改用户信息后，貌似session中的信息没有立即更新，所以存了这个
        model.addAttribute("user",userService.findUserById(user.getId()));

        return "user/personInfo";
    }

    /**
     * 更新用户信息
     * @param session
     * @param user
     * @param resume
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    public String updatePersonInfo(HttpSession session, Model model,
                                    @ModelAttribute("user")  User user, @ModelAttribute("resume") Resume resume){

        if(user.getName() == "" || user.getEmail() == "" || user.getPhone() == "" || resume.getGrade() == "" || resume.getLocation() == ""){

            model.addAttribute("msg", "2");
            return "user/personInfo";
        }

        int affectRows = userService.updateUser(user, resume);
        if(affectRows != 2){
            model.addAttribute("msg", "0");
        }else{
            user = userService.findUserById(user.getId());
            resume = userService.findResumeById(user.getId());
            model.addAttribute("msg", "1");
            session.setAttribute("user", user);
        }

        return "user/personInfo";
    }

    /**
     * 我的应聘列表
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/deliverJobList")
    public String deliverJobList(@RequestParam(value = "status", defaultValue = "3") int status,
                                 @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                                 @RequestParam(value = "rows", defaultValue = "5") int rows,HttpSession session, Model model){

        User user = (User) session.getAttribute("user");
        Integer userId = user.getId();
        Resume resume = userService.findResumeById(user.getId());
        PageBean<DeliverListBean> deliverList = userService.findDeliverListByPage(resume.getId(), currentPage, rows, status);

        model.addAttribute("pb", deliverList);
        model.addAttribute("status", status);
        return "user/deliverJobList";
    }

    /**
     * 添加获奖经历
     * @param honor
     * @param model
     * @return
     */
    @RequestMapping(value = "/addHonor", method = RequestMethod.POST)
    public String addHonor(Honor honor, Model model){

        if(honor.getName() == ""){
            return "redirect:/user/resume?msg=2";
        }
        if(userService.addHonor(honor) == 1){
            return "redirect:/user/resume?msg=1";
        }else{
            return "redirect:/user/resume?msg=0";
        }
    }

    @GetMapping(value = "/deleteHonor/{id}")
    public String deleteHonor(@PathVariable int id){

        userService.deleteHonor(id);
        return "redirect:/user/resume";
    }

    /**
     * 项目经历
     * @param project
     * @param model
     * @return
     */
    @RequestMapping(value = "/addProject", method = RequestMethod.POST)
    public String addProject(Project project, Model model){

        if(project.getName() == "" || project.getWork() == "" || project.getDescription() == ""){
            return "redirect:/user/resume?msg=2";
        }
        if(userService.addProject(project) == 1){
            return "redirect:/user/resume?msg=1";
        }else{
            return "redirect:/user/resume?msg=0";
        }
    }

    @GetMapping(value = "/deleteProject/{id}")
    public String deleteProject(@PathVariable int id){

        userService.deleteProject(id);
        return "redirect:/user/resume?msg=3";
    }

    /**
     * 个人优势
     * @param advantage
     * @param model
     * @return
     */
    @RequestMapping(value = "/addAdvantage", method = RequestMethod.POST)
    public String addAdvantage(Advantage advantage, Model model){

        if(advantage.getName() == ""){
            return "redirect:/user/resume?msg=2";
        }
        if(userService.addAdvantage(advantage) == 1){
            return "redirect:/user/resume?msg=1";
        }else{
            return "redirect:/user/resume?msg=0";
        }
    }

    @GetMapping(value = "/deleteAdvantage/{id}")
    public String deleteAdvantage(@PathVariable int id){

        userService.deleteAdvantage(id);
        return "redirect:/user/resume?msg=3";
    }

    /**
     * 社会工作
     * @param
     * @return
     */
    @RequestMapping(value = "/addSocialWork", method = RequestMethod.POST)
    public String addSocialWork(SocialWork socialWork, Model model){

        if(socialWork.getName() == "" || socialWork.getWork() == "" || socialWork.getDescription() == ""){
            return "redirect:/user/resume?msg=2";
        }
        if(userService.addSocialWork(socialWork) == 1){
            return "redirect:/user/resume?msg=1";
        }else{
            return "redirect:/user/resume?msg=0";
        }
    }

    @GetMapping(value = "/deleteSocialWork/{id}")
    public String deleteSocialWork(@PathVariable int id){

        userService.deleteSocialWork(id);
        return "redirect:/user/resume?msg=3";
    }


    /**
     * 删除一个用户
     * @param userId
     * @return
     */
    @GetMapping(value = "/deleteUser/{userId}/{currentPage}")
    public String deleteUser(HttpSession session, @PathVariable int userId, @PathVariable int currentPage){
        User admin = (User) session.getAttribute("admin");
        if(userId != admin.getId()){
            userService.deleteUserById(userId);
        }
        return "redirect:/admin/userList?currentPage=" + currentPage;
    }

    /**
     * 修改密码
     * @return
     */
    @GetMapping("/updatePassword")
    public String updatePassword(){

        return "user/password-reset";
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    public String updatePassword(HttpSession session, Model model, @ModelAttribute("origin") String origin,
                                 @ModelAttribute("newPassword") String newPassword, @ModelAttribute("confirm") String confirm){

        User user = (User) session.getAttribute("user");
        if("".equals(origin) || "".equals(newPassword) || "".equals(confirm)){
            model.addAttribute("msg", "请完善信息！！");

            return "user/password-reset";
        }
        if(!user.getPassword().equals(origin)){
            model.addAttribute("msg", "原密码错误！");
            return "user/password-reset";
        }
        if(!newPassword.equals(confirm)){
            model.addAttribute("msg", "两次密码不一致！");
            return "user/password-reset";
        }
        if(user.getPassword().equals(newPassword)){
            model.addAttribute("msg", "密码不能与原密码相同！！");
            return "user/password-reset";
        }
        if(userService.updatePassword(user.getId(), newPassword) == 1){
            // model.addAttribute("msg", "修改密码成功！");
            System.out.println("修改成功");
            session.removeAttribute("user");
            session.invalidate();
            return "redirect:/";
        }
        return null;
    }
}
