package band.wukong.mz.g.sku.dao;

import band.wukong.mz.g.sku.bean.Sku;
import org.nutz.dao.QueryResult;

/**
 * As you see...
 *
 * @author wukong(wukonggg@139.com)
 */
public interface SkuDao {

    /**
     * 保存Sku和more，如果发现没有对应goods，抛出异常
     *
     * @param s s
     * @return
     */
    Sku insertWithMore(Sku s);

    /**
     * find from db
     *
     * @param id id
     * @return
     */
    Sku findWithLinks(Long id);


    /**
     * update
     *
     * @param s s
     */
    void updateWithMore(Sku s);

    /**
     * remove
     *
     * @param id id
     */
    void rm(Long id);

    /**
     * 查询
     *
     * @param cateCode cateCode
     * @param qcond qcond
     * @param pageNum page number
     * @param pageSize page size
     * @return QueryResult 包含GoodsList和Page
     */
    QueryResult list(String cateCode, String qcond, int pageNum, int pageSize);

}
