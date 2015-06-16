package band.wukong.mz.g;

import band.wukong.mz.g.category.bean.Category;
import band.wukong.mz.g.category.service.SimpleCategoryService;
import band.wukong.mz.g.AppWebConst;
import org.nutz.ioc.Ioc;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import javax.servlet.ServletContext;
import java.util.Map;

/**
 * Main Setup
 *
 * @author wukong(wukonggg@139.com)
 */
public class MainSetup implements Setup {
    private static final Log log = Logs.get();

    @Override
    public void init(NutConfig nc) {
        log.info("MainSetup init...");

        Ioc ioc = nc.getIoc();

        loadCategory(ioc.get(SimpleCategoryService.class), nc.getServletContext());

    }

    @Override
    public void destroy(NutConfig nc) {
        log.info("MainSetup destroy...");
    }

    /**
     * 载入category
     * @param cateService
     * @param context
     */
    private void loadCategory(SimpleCategoryService cateService, ServletContext context) {
        Map<String, Category> cateMap = cateService.listAllFlat();
        context.setAttribute(AppWebConst.APP_CATE_FLAT_MAP, cateMap);
    }
}
