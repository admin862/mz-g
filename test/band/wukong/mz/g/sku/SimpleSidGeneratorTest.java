package band.wukong.mz.g.sku;

import band.wukong.mz.g.closedsource.SimpleSidGenerator;
import band.wukong.mz.g.sku.bean.Sku;
import band.wukong.mz.nutz.NutzTestHelper;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.nutz.ioc.Ioc;

/**
 * As you see...
 *
 * @author wukong(wukonggg@139.com)
 */
public class SimpleSidGeneratorTest {
    private Ioc ioc;
    private SimpleSidGenerator genarator;

    @Before
    public void setUp() throws ClassNotFoundException {
        ioc = NutzTestHelper.createIoc();
        genarator = ioc.get(SimpleSidGenerator.class);
    }

    @After
    public void tearDown() {
        NutzTestHelper.destroyIoc(ioc);
    }

    @Test
    public void nextSid() {
        Sku s1 = new Sku();
        s1.setPprice(1);
        System.out.println(genarator.nextSid("S-1", s1));

        Sku s2 = new Sku();
        s2.setPprice(22);
        System.out.println(genarator.nextSid("S-5", s2));

        Sku s3 = new Sku();
        s3.setPprice(333);
        System.out.println(genarator.nextSid("S-8", s3));
    }


}
