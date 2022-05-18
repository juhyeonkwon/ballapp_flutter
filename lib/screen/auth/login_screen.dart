
import 'package:ballapp/screen/auth/widgets/kakao_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../navigation/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
              color: Colors.blue
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const KakaoLoginWidget(),
              ElevatedButton(
                onPressed: (){ naverLogin();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => BottomNavigation(),
                )); },
                child: const Text(
                  "네이버 로그인", style: TextStyle(
                  color: Colors.white,
                ),), )
            ],
          ),
        )
      )
    );
  }


  Future<void> kakaoLogin() async {
    UserApi.instance.logout();
    var data;
    if (await isKakaoTalkInstalled()) {
      try {
        data = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공, $data');

      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          data = await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공 $data');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        data = await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공 $data');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("token", data.accessToken);
  }

  Future<void> getToken() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      print('토큰 정보 보기 성공'
          '\n회원정보: ${tokenInfo.id}'
          '\n만료시간: ${tokenInfo.expiresIn} 초');

    } catch (error) {
      print('토큰 정보 보기 실패 $error');
    }

    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}');


    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  Future<void> naverLogin() async {
    await FlutterNaverLogin.logOut();
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    NaverAccessToken res = await FlutterNaverLogin.currentAccessToken;

    print(result);
    print(res);

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("token", res.accessToken);

  }

}
