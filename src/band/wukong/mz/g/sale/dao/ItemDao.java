package band.wukong.mz.g.sale.dao;

import band.wukong.mz.g.sale.bean.Item;

import java.util.List;

/**
 * description
 *
 * @author wukong(wukonggg@139.com)
 */
public interface ItemDao {

    /**
     * save
     *
     * @param item
     */
    public void save(Item item);

    /**
     * find
     *
     * @param id
     * @return
     */
    public Item find(long id);

    /**
     * update
     *
     * @param item
     */
    public void update(Item item);

    /**
     * list by order
     *
     * @param orderId orderId
     * @return item list
     */
    public List<Item> listWithSkuByOrder(long orderId);
}
