package com.nwpu.dao;
import com.nwpu.domain.ResumeDeliver;
import com.nwpu.pojo.DeliverListBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IResumeDeliverDao {

    /**
     * 查找投递列表
     * @param map
     * @return
     */
    List<DeliverListBean> findDeliverListByPage(Map map);

    /**
     * 查找收到简历列表
     * @param map
     * @return
     */
    List<Object> findJobReceiveResumesByPage(Map<String, Object> map);

    /**
     * 条件查找投递列表
     * @param resumeId
     * @param status
     * @return
     */
    int findAllByDeliverByStatus(@Param("resumeId") Integer resumeId, @Param("status") int status);

    /**
     * 查找收到简历总数
     * @param jobId
     * @param status
     * @return
     */
    int findCountJobReceiveByStatus(@Param("jobId") Integer jobId, @Param("status") int status);

    /**
     * 增加一条投递
     * @param resumeDeliver
     * @return
     */
    int saveDeliver(ResumeDeliver resumeDeliver);

    /**
     * 判断是否投递
     * @param resumeId
     * @param jobId
     * @return
     */
    int isDeliver(@Param("resumeId") Integer resumeId, @Param("jobId") Integer jobId);

    /**
     * 更新简历状态
     * @param status
     * @param resumeId
     * @param jobId
     */
    void updateStatus(@Param("status")int status, @Param("resumeId")int resumeId, @Param("jobId")int jobId);

    /**
     * 查找一条记录
     * @param jobId
     * @return
     */
    ResumeDeliver findJobByJobId(int jobId);

    /**
     * 删除一条记录
     * @param id
     */
    void deleteById(int id);
}
