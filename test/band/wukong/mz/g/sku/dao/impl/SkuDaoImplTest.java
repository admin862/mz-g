package band.wukong.mz.g.sku.dao.impl;

import band.wukong.mz.g.category.SimpleCateConst;
import band.wukong.mz.g.sku.bean.Goods;
import band.wukong.mz.g.sku.bean.Sku;
import band.wukong.mz.g.sku.bean.SkuMore;
import band.wukong.mz.g.sku.dao.GoodsDao;
import band.wukong.mz.g.sku.dao.SkuDao;
import band.wukong.mz.nutz.NutzTestHelper;
import com.alibaba.fastjson.JSONArray;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.Ioc;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * As you see...
 *
 * @author wukong(wukonggg@139.com)
 */
public class SkuDaoImplTest {
    private Ioc ioc;
    private GoodsDao gDao;
    private SkuDao skuDao;

    @Before
    public void setUp() throws ClassNotFoundException {
        ioc = NutzTestHelper.createIoc();
        gDao = ioc.get(GoodsDao.class);
        skuDao = ioc.get(SkuDao.class);
    }

    @After
    public void tearDown() {
        NutzTestHelper.destroyIoc(ioc);
    }


    @Test
    public void insert() {
        Goods g = createGoods();
        g = gDao.insert(g);
        Sku sc = createSkuWithMore(g.getId());

        Sku sku = skuDao.insertWithMore(sc);
        Assert.assertNotNull(sku);
        Assert.assertNotNull(sku.getId());
    }

    @Test
    public void insertWithMore() {
        Goods g = createGoods();
        g = gDao.insert(g);
        Sku sc = createSkuWithMore(g.getId());

        Sku sc1 = skuDao.insertWithMore(sc);
        Assert.assertNotNull(sc1);
        Assert.assertNotNull(sc1.getMoreList());
        System.out.println("JSONArray.toJSONString(sc1) = " + JSONArray.toJSONString(sc1));
        System.out.println("JSONArray.toJSONString(sc1.getMoreList()) = " + JSONArray.toJSONString(sc1.getMoreList()));
    }

    @Test
    public void findWithMore() {
        Goods g = createGoods();
        g = gDao.insert(g);
        Sku sku = createSkuWithMore(g.getId());
        Sku sku1 = skuDao.insertWithMore(sku);

        Sku sku2 = skuDao.findWithLinks(sku1.getId());
        Assert.assertNotNull(sku2);
    }

    @Test
    public void updateWithMore() {
        Goods g = createGoods();
        g = gDao.insert(g);
        Sku sku = createSkuWithMore(g.getId());
        Sku sku1 = skuDao.insertWithMore(sku);
        Sku sku2 = skuDao.findWithLinks(sku1.getId());

        String model = "junit_model-wakaka";
        Date now = new Date();
        sku2.setModel(model);
        sku2.setUtime(now);
        sku2.setMoreList(createMoreList2());
        skuDao.updateWithMore(sku2);
        Sku sku3 = skuDao.findWithLinks(sku2.getId());

        Assert.assertEquals(model, sku3.getModel());
        Assert.assertEquals(now.toString(), sku3.getUtime().toString());
        System.out.println("now.toString() = " + now.toString());
        System.out.println("gs3.getUtime().toString() = " + sku3.getUtime().toString());
    }

    public void rm() {
        Goods g = createGoods();
        g = gDao.insert(g);
        Sku sku = createSkuWithMore(g.getId());
        Sku sku1 = skuDao.insertWithMore(sku);

        skuDao.rm(sku1.getId());
        Sku sku2 = skuDao.findWithLinks(sku1.getId());
        Assert.assertEquals(Sku.STATE_RM, sku2.getState());
    }

    @Test
    public void list() {
        QueryResult qr = skuDao.list(SimpleCateConst.CATE_CODE_A_SYTZ, "", 1, 10);
        Assert.assertNotNull(qr);

        Pager pager = qr.getPager();
        @SuppressWarnings("unchecked")
        List<Sku> scList = qr.getList(Sku.class);

        Assert.assertNotNull(pager);
        Assert.assertNotNull(scList);

        System.out.println("pager = " + pager);
        System.out.println("scList.size() = " + scList.size());
        System.out.println("scList.get(0) = " + scList.get(0));
        System.out.println("scList.get(0).getGoods().getGname() = " + scList.get(0).getGoods().getGname());

    }

    private Goods createGoods() {
        Goods g = new Goods();
        g.setCateCode(SimpleCateConst.CATE_CODE_A_SYTZ);
        g.setGname("junit_米奇女童羽绒服");
        g.setImg("junit_img.png");
        g.setWords("junit_words");
        g.setCtime(new Date());
        g.setState(Goods.STATE_OK);
        return g;
    }

    private Sku createSkuWithMore(long goodsId) {
        Date now = new Date();
        Sku sku = new Sku();
        sku.setSid("junit_sid");
        sku.setModel("junit_model");
        sku.setType("junit_size_standard");
        sku.setPprice(20);
        sku.setPtime(now);
        sku.setSprice(50);
        sku.setImg("junit_img.png");
        sku.setCtime(now);
        sku.setState(Sku.STATE_ON);
        sku.setGoodsId(goodsId);

        SkuMore sm1 = new SkuMore();
        sm1.setSize("XL");
        sm1.setCount(99);
        SkuMore sm2 = new SkuMore();
        sm2.setSize("L");
        sm2.setCount(88);

        List<SkuMore> skuMoreList = new ArrayList<SkuMore>();
        skuMoreList.add(sm1);
        skuMoreList.add(sm2);

        sku.setMoreList(skuMoreList);

        return sku;
    }

    private List<SkuMore> createMoreList2() {
        List<SkuMore> scmList = new ArrayList<SkuMore>();

        SkuMore scm1 = new SkuMore();
        scm1.setSize("junit_size_1junit_size_1");
        scm1.setCount(11);
        scm1.setRemark("junit_remarkjunit_remark");
        scmList.add(scm1);

        SkuMore scm2 = new SkuMore();
        scm2.setSize("junit_size_2junit_size_2");
        scm2.setCount(22);
        scmList.add(scm2);

        return scmList;
    }
}
