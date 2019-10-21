import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TpaPage extends StatefulWidget {
  @override
  _TpaPageState createState() => _TpaPageState();
}

class _TpaPageState extends State<TpaPage> {
//  final String url = "https://lowcarbon-malang.id/system/api/admin/tpa";
  // String idTpa = "";

  final String url = "https://lowcarbon-malang.id/system/api/admin/tpa";
  List data;

  Future<String> getTpaData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // idTpa = prefs.getString("id_tpa");
    // print(idTpa);
    final res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(res);

    setState(() {
      final resBody = json.decode(res.body);
      data = resBody["data"];
      print("======================");
      print(resBody);
print("======================");
      
    });

    return "Succes!";
  }
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                snap: false,
                backgroundColor: Colors.lightBlueAccent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("DAFTAR TPA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
//                  background: Image.network(
//                    "https://cdn0-production-images-kly.akamaized.net/mbCCCWjkvTV9b1Jf5p2Oc1zOuA4=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2832638/original/037807400_1560947825-20190619-Anya-Geraldine-1.jpg",
//                  fit: BoxFit.cover),
                  background: Image.network(
                    "https://images.pexels.com/photos/392586/pexels-photo-392586.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  fit: BoxFit.cover),
                ),
              ),
        ];
      },
      body: ListView.builder(
        padding: EdgeInsets.only(top: 50.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
//          print(data[index]['nama_tpa']);
          return new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Tpa(
                             idTpa: data[index]["id_tpa"],
        namaTpa: data[index]["nama_tpa"],
        alamatTpa: data[index]["alamat_tpa"],
        noAlamat: data[index]["no_alamat"],
        rt: data[index]["rt"],
        rw: data[index]["rw"],
        districtId: data[index]["district_id"],
        latTpa: data[index]["lat_tpa"],
        lngTpa: data[index]["lng_tpa"],
        gambarTpa: data[index]["gambar_tpa"],
        usernameTpa: data[index]["username_tpa"],
        passwordTpa: data[index]["password_tpa"],
        kmlFile: data[index]["kml_file"],
        idTps: data[index]["id_tps"],
        namaTps: data[index]["nama_tps"],
        alamatTps: data[index]["alamat_tps"],
        latTps: data[index]["lat_tps"],
        lngTps: data[index]["lng_tps"],
        gambarTps: data[index]["gambar_tps"],
        usernameTps: data[index]["username_tps"],
        passwordTps: data[index]["password_tps"],
        idSampah: data[index]["id_sampah"],
        idJenisSampah: data[index]["id_jenis_sampah"],
        lat: data[index]["lat"],
        lng: data[index]["lng"],
        title: data[index]["title"],
        gambar: data[index]["gambar"],
        berat: data[index]["berat"],
        tertampung: data[index]["tertampung"],
        waktuDitambahkan: data[index]["waktu_ditambahkan"],
        id: data[index]["id"],
        idCity: data[index]["id_city"],
        districtName: data[index]["district_name"],
        postalCode: data[index]["postal_code"],
        beratSampah: data[index]["berat_sampah"],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTpaData();
  }

}

class Tpa extends StatelessWidget {
String idTpa;
    String namaTpa;
    String alamatTpa;
    String noAlamat;
    String rt;
    String rw;
    String districtId;
    String latTpa;
    String lngTpa;
    String gambarTpa;
    String usernameTpa;
    String passwordTpa;
    dynamic kmlFile;
    String idTps;
    String namaTps;
    String alamatTps;
    String latTps;
    String lngTps;
    String gambarTps;
    String usernameTps;
    String passwordTps;
    String idSampah;
    String idJenisSampah;
    String lat;
    String lng;
    String title;
    String gambar;
    String berat;
    String tertampung;
    String waktuDitambahkan;
    String id;
    String idCity;
    String districtName;
    String postalCode;
    String beratSampah;


  Tpa({
    this.idTpa,
        this.namaTpa,
        this.alamatTpa,
        this.noAlamat,
        this.rt,
        this.rw,
        this.districtId,
        this.latTpa,
        this.lngTpa,
        this.gambarTpa,
        this.usernameTpa,
        this.passwordTpa,
        this.kmlFile,
        this.idTps,
        this.namaTps,
        this.alamatTps,
        this.latTps,
        this.lngTps,
        this.gambarTps,
        this.usernameTps,
        this.passwordTps,
        this.idSampah,
        this.idJenisSampah,
        this.lat,
        this.lng,
        this.title,
        this.gambar,
        this.berat,
        this.tertampung,
        this.waktuDitambahkan,
        this.id,
        this.idCity,
        this.districtName,
        this.postalCode,
        this.beratSampah,
  });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: new Container(
          padding: new EdgeInsets.all(60.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage( "https://lowcarbon-malang.id/system/assets/" + gambarTpa),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter
            )
          ),
          child: new Column(
            children: <Widget>[
              new Text(namaTpa, style: new TextStyle(color: Colors.white, fontSize: 15.0, fontStyle: FontStyle.normal))
            ],
          ),
        ),
      )
    );
  }
}