package band.wukong.mz.g.sale.service;

import band.wukong.mz.base.bean.Period;
import band.wukong.mz.g.privilege.bean.User;
import band.wukong.mz.g.sale.bean.Cart;
import band.wukong.mz.g.sale.bean.Order;
import org.nutz.dao.QueryResult;

/**
 * description
 *
 * @author wukong(wukonggg@139.com)
 */
public interface OrderService {

    /**
     * find order within items by id
     *
     * @param id
     */
    Order find(long id);

    /**
     * 查询带有详细信息的order list。包括用户、购买的产品。
     *
     * @param pageNum     pageNum
     * @param pageSize    pageSize
     * @param p           period of order
     * @param qcondOnCust 可以是customer.cid/customer.name/customer.msisdn
     * @param u 当前用户
     * @return
     */
    QueryResult listDetail(int pageNum, int pageSize, Period p, String qcondOnCust, User u);


    /**
     * 支付/结帐
     * 1、查询用户是否存在、营业员是否存在。都存在才下一步
     * 2、查询产品的库存是否都足够。足够才下一步
     * 3、下单
     * 4、看下单内容中有无服装类。有就更新用户表服装paymentClothing的值，新值为原有值+新单中服装类商品的成交价
     * 5、更新库存
     * 6、删除购物车中已下单的产品
     *
     * @param carts  carts
     * @param userId userId
     * @throws band.wukong.mz.g.sale.OutOfStockException 库存不足时抛出。整个订购回滚
     */
    void pay(Cart[] carts, Long userId);


    /**
     * 退货
     * 1、查到item
     * 2、update item： 原count减去要退货的数量
     * 3、insert item：退货的数量，状态为'退货'，同时保存退货的时间和说明
     * 4、更新库存
     *
     * @param itemId  order表pk
     * @param count 退货数量
     * @param desc 退货说明
     */
    void restoreItem(long itemId, int count, String desc);


}
