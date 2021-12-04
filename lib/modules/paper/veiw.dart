import 'package:flutter/material.dart';

class PaperScreen extends StatefulWidget {
  @override
  _PaperScreenState createState() => _PaperScreenState();
}

class _PaperScreenState extends State<PaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/office.webp'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 350, top: 40),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffD3AD6A),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 270),
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "85",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 45, top: 20),
            child: Text(
              "استضافه مدير مركز التنميه الاجتماعيه",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 300),
            child: Text(
              "2020-5-5",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40, left: 20, top: 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                "هذا النص هو مثال لنص يمكن"
                " أن يستبدل في نفس المساحة، "
                "لقد تم توليد هذا النص من مولد النص العربى،"
                " حيث يمكنك أن تولد مثل هذا النص أو العديد من "
                "النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولده"
                " التطبيق إذا كنت تحتاج إلى عدد"
                " أكبر من الفقرات يتيح لك مولد النص العربى"
                " زيادة عدد الفقرات كما تريد،"
                " النص لن يبدو مقسما "
                "ولا يحوي أخطاء لغوية، مولد"
                " النص العربى مفيد لمصممي المواقع على وجه الخصوص،"
                " حيث يحتاج العميل فى كثير من الأحيان"
                " أن يطلع على صورة حقيقية لتصميم الموقع هذا النص "
                "هو مثال لنص يمكن أن يستبدل في نفس"
                " المساحة، لقد تم توليد هذا"
                " النص من مولد النص العربى،"
                " حيث يمكنك أن تولد مثل هذا النص "
                "أو العديد من النصوص الأخرى"
                " إضافة إلى زيادة عدد الحروف التى يولدها التطبيق",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 19,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
