
import com.hniois.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/webService/test")
public class TestTraceAction extends BaseController {

    String test="test/test_list";

    /**
     * 分页查询
     * @param e
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView test()throws Exception{
      ModelAndView mv=getModelAndView();
      mv.setViewName(test);
      return mv;
    }
}
