
import 'package:firabasekullanicikayit/kayitekrani.dart';
import 'package:flutter/material.dart';

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Parola",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
                height: 70,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("Giriş Yap"),)
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => KayitEkrani()));
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text("Kayıt Ol", style: TextStyle(
                    fontSize: 16
                  ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
