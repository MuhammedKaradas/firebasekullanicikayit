import 'package:firabasekullanicikayit/anasayfa.dart';
import 'package:firabasekullanicikayit/girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class KayitEkrani extends StatefulWidget {
  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  //------

  String email, parola;

  //------

  var _formAnahtari = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Kayıt"),
        centerTitle: true,
      ),
      body: Form(
        key: _formAnahtari,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (alinanMail) {
                    setState(() {
                      email = alinanMail;
                    });
                  },
                  validator: (alinanMail) {
                    return alinanMail.contains("@")
                        ? null
                        : "Mail Adresiniz Geçersiz! Lütfen Geçerli Bir Mail Adresi Giriniz!";
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Adresinizi Giriniz",
                    hintText: "Lütfen Geçerli Bir Email Adresi Giriniz:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (alinanParola) {
                    parola = alinanParola;
                  },
                  validator: (alinanParola) {
                    return alinanParola.length >= 6
                        ? null
                        : "Parolanız En Az 6 Karakter Olmalıdır!";
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Parolanızı Giriniz",
                    hintText: "Lütfen Parolanızı Giriniz:",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      kayitEkle();
                    },
                    child: Text("Kayıt Ol"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: GoogleFonts.roboto(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Giriş Sayfasına Yönlendirir
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => GirisEkrani()));
                    },
                    child: Text(
                      "Mevcut Bir Hesabım Bulunmakta",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Email ve Parolayı Alıp Firebasede Kullanıcı Ekleme İşlemi
  void kayitEkle() {
    if (_formAnahtari.currentState.validate()) {
      /*setState(() {
        Fluttertoast.showToast(msg: "Kaydınız Başarılı...");
      });*/

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: parola)
          .then((user) {
        //Başarılıysa Ana Sayfaya Yönlendir
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => AnaSayfa()),
            (Route<dynamic> route) => false);
      }).catchError((hata) {
        //Başar ısız İse Hata Mesajı Göster
        Fluttertoast.showToast(msg: hata);
      });
    }
  }
}
