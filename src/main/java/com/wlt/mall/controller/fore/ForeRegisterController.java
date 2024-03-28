package com.wlt.mall.controller.fore;

import com.alibaba.fastjson.JSONObject;
import com.wlt.mall.controller.BaseController;
import com.wlt.mall.entity.Address;
import com.wlt.mall.entity.User;
import com.wlt.mall.service.AddressService;
import com.wlt.mall.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;


@Controller
public class ForeRegisterController extends BaseController {
    @Resource(name = "addressService")
    private AddressService addressService;
    @Resource(name="userService")
    private UserService userService;

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String goToPage(Map<String,Object> map) {
//        String addressId = "110000";
//        String cityAddressId = "110100";
//        logger.info("获取省份信息");
//        List<Address> addressList = addressService.getRoot();
//        logger.info("获取addressId为{}的市级地址信息", addressId);
//        List<Address> cityAddress = addressService.getList(null, addressId);
//        logger.info("获取cityAddressId为{}的区级地址信息", cityAddressId);
//        List<Address> districtAddress = addressService.getList(null, cityAddressId);
//        map.put("addressList", addressList);
//        map.put("cityList", cityAddress);
//        map.put("districtList", districtAddress);
//        map.put("addressId", addressId);
//        map.put("cityAddressId", cityAddressId);
        logger.info("转到前台-用户注册页");
        return "fore/register";
    }

    @ResponseBody
    @RequestMapping(value = "register/doRegister", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String register(
            @RequestParam(value = "user_name") String user_name  /*用户名 */,
            @RequestParam(value = "user_nickname") String user_nickname  /*用户昵称 */,
            @RequestParam(value = "user_password") String user_password  /*用户密码*/,
            @RequestParam(value = "user_gender") String user_gender  /*用户性别*/,
            @RequestParam(value = "user_birthday") String user_birthday /*用户生日*/
    ) throws ParseException {
        logger.info("验证用户名是否存在");
        Integer count = userService.getTotal(new User().setUser_name(user_name));
        if (count > 0) {
            logger.info("用户名已存在，返回错误信息!");
            JSONObject object = new JSONObject();
            object.put("success", false);
            object.put("msg", "The username already exists, please re-enter it!");
            return object.toJSONString();
        }
        logger.info("创建用户对象");
        User user = new User()
                .setUser_name(user_name)
                .setUser_nickname(user_nickname)
                .setUser_password(user_password)
                .setUser_gender(Byte.valueOf(user_gender))
                .setUser_birthday(new SimpleDateFormat("yyyy-MM-dd").parse(user_birthday))
                .setUser_address(new Address().setAddress_areaId("130000"))
                .setUser_homeplace(new Address().setAddress_areaId("130000"));
        logger.info("User Registration");
        if (userService.add(user)) {
            logger.info("Registration is successful");
            JSONObject object = new JSONObject();
            object.put("success", true);
            return object.toJSONString();
        } else {
            throw new RuntimeException();
        }
    }
}
