import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  double? result;
  bool isHovering = false;

  void calculate(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num2 != 0 ? num1 / num2 : null;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF820439),
        title: Text(
          'Hesap Makinesi',
          style: GoogleFonts.bebasNeue(fontSize: 26, color: Color(0xFFA95A6D)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/download.jpg'),
            ),
            SizedBox(height: 20),


            Text(
              'Bu uygulama ile dört işlem yapabilirsiniz.',
              style: GoogleFonts.poppins(fontSize: 18, color: Color(0xFFA95A6D)),
            ),
            SizedBox(height: 20),

           //birinci sayıyı girme
            TextField( //verileri kontrol et
              controller: num1Controller, //girilen sayı
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Birinci Sayı',
                hintStyle: GoogleFonts.bonaNova(),
                filled: true,
                fillColor: Color(0xFFA95A6D),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10), // iki giris arasında 10px alan acar.

           //ikinci sayıyı girme
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number, //kullanıcıya sadece tus takımını acar
              decoration: InputDecoration(
                hintText: 'İkinci Sayı',
                hintStyle: GoogleFonts.bonaNova(),
                filled: true,
                fillColor: Color(0xFFA95A6D),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),

            // islem
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //tum islemleri esit boyutlarla koy
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: Text('+', style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA95A6D)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: Text('-', style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA95A6D)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  child: Text('*', style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA95A6D)),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: Text('/', style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA95A6D)),
                ),
              ],
            ),
            SizedBox(height: 20),

            // sonuc ve hover
            MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: isHovering ? Color(0xFFA95A6D) : Color(0xFFE8B4C5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  result != null ? 'Sonuç: $result' : 'Lütfen bir işlem seçin',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF820439),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

