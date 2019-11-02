import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hava_durumum/view_model/temam_view_modeli.dart';
import 'package:hava_durumum/view_model/weather_view_model.dart';
import 'package:hava_durumum/widget/SehirSec.dart';
import 'package:hava_durumum/widget/gecisli_arkaplan.dart';
import 'package:provider/provider.dart';

import 'HavaDurumuResim.dart';
import 'Lokasyon.dart';
import 'MaxMinDerece.dart';
import 'SonGuncellemeWidget.dart';

class HavaDurumum extends StatelessWidget {
  String secilenSehir = "Ankara";
  WeatherViewModel _weatherViewModel;

  @override
  Widget build(BuildContext context) {
    //enjekte ettik
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hava Durumu"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              secilenSehir = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SehirSecWidget()));
              debugPrint(secilenSehir);
              _weatherViewModel.HavaDurmumunuAl(secilenSehir);
            },
          )
        ],
      ),
      body: Center(
        child: (_weatherViewModel.durum == WeatherDurumlari.Yuklendi)
            ? HavaDurumuGeldi()
            : (_weatherViewModel.durum == WeatherDurumlari.Yukleniyor)
            ? havaDurumuYukleniyor()
            : (_weatherViewModel.durum == WeatherDurumlari.Hata)
            ? havaDurumuGetirmeHataDurumunda()
            : Text("Şehir seç"),
      ),
    );
  }

  havaDurumuYukleniyor() {
    return CircularProgressIndicator();
  }

  havaDurumuGetirmeHataDurumunda() {
    Text("Şehir seçin");
  }
}

class HavaDurumuGeldi extends StatefulWidget {
  @override
  _HavaDurumuGeldiState createState() => _HavaDurumuGeldiState();
}

class _HavaDurumuGeldiState extends State<HavaDurumuGeldi> {
  WeatherViewModel _weatherViewModel;
  Completer<void> _refresfIndicator = Completer<void>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresfIndicator = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var kisaltma =
      Provider.of<WeatherViewModel>(context).HavaDurumuKisaltmasi();
      debugPrint(kisaltma + "kısalmamız");
      Provider.of<TemamViewModeli>(context).temaDegistir(kisaltma);
    });
  }

  @override
  Widget build(BuildContext context) {
    _refresfIndicator.complete();
    _refresfIndicator = Completer<void>();
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    String secilenSehir = _weatherViewModel.getirilenHavaDurumu.title;

    return GradientArkaplan(
        renk: Provider
            .of<TemamViewModeli>(context)
            .myTheme
            .renk,
        child: RefreshIndicator(
        onRefresh: ()
    {
      _weatherViewModel.GuncelHavaDurmumunuAl(secilenSehir);
      return _refresfIndicator.future;
    },
    child: ListView(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
    child: LokasyonWidget(
    secilenSehir: secilenSehir,
    )),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: SonGuncellemeWidget()), //Parametresiz
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: HavaDurumuResim()),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0), //Parametreli kullanım
    child: Center(
    child: MaxMinDerece(_weatherViewModel
        .getirilenHavaDurumu.consolidatedWeather[0])),
    )
    ]
    ,
    )
    ,
    )
    );
  }
}
