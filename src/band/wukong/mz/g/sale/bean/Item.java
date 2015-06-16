package band.wukong.mz.g.sale.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

import java.util.Date;

/**
 * description
 *
 * @author wukong(wukonggg@139.com)
 */
@Table("t_item")
public class Item {

    /**
     * 状态-删除
     */
    public static final String STATE_RM = "0";

    /**
     * 状态-有效
     */
    public static final String STATE_OK = "1";

    /**
     * 状态-退货
     */
    public static final String STATE_RETURN = "2";

    @Id
    private long id;

    @Column("sku_id")
    private long skuid; //sku主表pk

    @Column("sku_more_id")
    private long skuMoreId; //skumore表pk

    @Column("sprice_snapshot")
    private long sprice; //当前的零售价

    @Column
    private long dprice; //成交价格

    @Column
    private int dcount; //成交数量

    @Column
    private long payment;    //付款金额

    @Column("change_desc")
    private String chDesc;

    @Column("change_time")
    private Date chTime;

    @Column
    private String state;

    @Column("order_id")
    private long oid;

    private Sku4Item sku;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getSkuid() {
        return skuid;
    }

    public void setSkuid(long skuid) {
        this.skuid = skuid;
    }

    public long getSkuMoreId() {
        return skuMoreId;
    }

    public void setSkuMoreId(long skuMoreId) {
        this.skuMoreId = skuMoreId;
    }

    public long getSprice() {
        return sprice;
    }

    public void setSprice(long sprice) {
        this.sprice = sprice;
    }

    public long getDprice() {
        return dprice;
    }

    public void setDprice(long dprice) {
        this.dprice = dprice;
    }

    public int getDcount() {
        return dcount;
    }

    public void setDcount(int dcount) {
        this.dcount = dcount;
    }

    public long getPayment() {
        return payment;
    }

    public void setPayment(long payment) {
        this.payment = payment;
    }

    public String getChDesc() {
        return chDesc;
    }

    public void setChDesc(String chDesc) {
        this.chDesc = chDesc;
    }

    public Date getChTime() {
        return chTime;
    }

    public void setChTime(Date chTime) {
        this.chTime = chTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public long getOid() {
        return oid;
    }

    public void setOid(long oid) {
        this.oid = oid;
    }

    public Sku4Item getSku() {
        return sku;
    }

    public void setSku(Sku4Item sku) {
        this.sku = sku;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", skuid=" + skuid +
                ", skuMoreId=" + skuMoreId +
                ", sprice=" + sprice +
                ", dprice=" + dprice +
                ", dcount=" + dcount +
                ", payment=" + payment +
                ", chDesc='" + chDesc + '\'' +
                ", chTime=" + chTime +
                ", state='" + state + '\'' +
                ", oid=" + oid +
                ", sku=" + sku +
                '}';
    }
}
