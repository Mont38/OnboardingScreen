import 'package:app1/screeen/responsive.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../widgets/loading_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//lo debajo son text from donde se ponen los recuadros donde van tanto el correo como la contraseña
//se le puso OutlineInputBorder para poner la linea que rodea los bordes de la caja de texto
class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = TextFormField(
    decoration: const InputDecoration(
        label: Text('Tu correo baboso'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromRGBO(255, 123, 137, 0.5),
          ),
        ),
        border: OutlineInputBorder()),
  );
  final txtPass = TextFormField(
    decoration: const InputDecoration(
        label: Text('Tu contrasenia baboso'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromRGBO(255, 123, 137, 0.5),
          ),
        ),
        border: OutlineInputBorder()),
    obscureText: true,
  );

  final spaceHorizontal = SizedBox(
    height: 10,
  );
  //Aqui debajo se importó una "libreria" de dev.net que agrega botonos para login de diferentes medias, como google, facebook, etc.

  final btnGoogle = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, onPressed: () {});
  final btnFace = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});
  final btnGit = SocialLoginButton(
      buttonType: SocialLoginButtonType.github, onPressed: () {});

  final imgLogo = Image.asset(
    'assets/logo.png',
    height: 200,
  );
  final imgLogoDesktop = Image.asset(
    'logoDes.jpg',
    height: 300,
  );

  @override
  Widget build(BuildContext context) {
    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          )),
    );

    final btnEmail = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(Duration(milliseconds: 4000)).then((value) {
            isLoading = false;
            setState(() {});
            Navigator.pushNamed(context, '/dash');
          });
        });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: .9,
              fit: BoxFit.cover,
              image: AssetImage('assets/Back.jpg'),
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      30), //aqui se le da un padding horizontal simetrico a las cajas de texto para que estas no abarquen toda la pantalla de forma horizontal
              child: Stack(
                children: [
                  Column(
                    children: [
                      Responsive(
                          mobile: MobileLoginScreen(
                            txtEmail: txtEmail,
                            spaceHorizontal: spaceHorizontal,
                            txtPass: txtPass,
                            btnEmail: btnEmail,
                            btnGoogle: btnGoogle,
                            btnFace: btnFace,
                            btnGit: btnGit,
                            txtRegister: txtRegister,
                            imgLogo: imgLogo,
                          ),
                          desktop: Container(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 230),
                                child: Row(
                                  verticalDirection: VerticalDirection.down,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: imgLogoDesktop,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        children: [
                                          txtEmail,
                                          spaceHorizontal,
                                          spaceHorizontal,
                                          txtPass,
                                          spaceHorizontal,
                                          spaceHorizontal,
                                          spaceHorizontal,
                                          btnEmail,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  spaceHorizontal,
                                                  spaceHorizontal,
                                                  spaceHorizontal,
                                                  spaceHorizontal,
                                                  btnGoogle,
                                                  spaceHorizontal,
                                                  btnFace,
                                                  spaceHorizontal,
                                                  btnGit,
                                                  spaceHorizontal,
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
    required this.txtEmail,
    required this.spaceHorizontal,
    required this.txtPass,
    required this.btnEmail,
    required this.btnGoogle,
    required this.btnFace,
    required this.btnGit,
    required this.txtRegister,
    required this.imgLogo,
  });

  final TextFormField txtEmail;
  final SizedBox spaceHorizontal;
  final TextFormField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnFace;
  final SocialLoginButton btnGit;
  final Padding txtRegister;
  final Image imgLogo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: imgLogo,
            margin: EdgeInsets.only(bottom: 15),
            height: 200,
          ),
          txtEmail,
          spaceHorizontal,
          txtPass,
          spaceHorizontal,
          btnEmail,
          spaceHorizontal,
          btnGoogle,
          spaceHorizontal,
          btnFace,
          spaceHorizontal,
          btnGit,
          spaceHorizontal,
          txtRegister,
        ],
      ),
    );
  }
}
