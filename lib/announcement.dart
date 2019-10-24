import 'package:flutter/material.dart';
import 'package:hero_widget_example/announcement_detail.dart';
import 'package:hero_widget_example/announcement_model.dart';

class AnnouncementListPage extends StatefulWidget {
  @override
  _AnnouncementListPageState createState() => _AnnouncementListPageState();
}

class _AnnouncementListPageState extends State<AnnouncementListPage> {
  List<AnnouncementModel> announcementList = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "hero_tag",
        child: new Icon(Icons.done), onPressed: () {},
      ),
      appBar: _buildAppBar,
      body: _buildMainContent,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: Text("Announcement"),
    );
  }

  Container get _buildMainContent {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      height: MediaQuery.of(context).size.height * 0.70,
      child: _buildListView,
    );
  }

  ListView get _buildListView {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: announcementList.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementDetailPage(announcementModel: announcementList[index])),
                );
              },
              child: _buildCard(index),
            ),
          );
        });
  }

  Card _buildCard(int index) {
    return Card(
      semanticContainer: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: _buildCardImage(index),
          ),
          Expanded(child: _buildCardTitle(index))
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Hero _buildCardImage(int index) {
    return Hero(
      tag: "${announcementList[index].photoUrl}",
      child: Image.network(
        announcementList[index].photoUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Padding _buildCardTitle(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: Center(
          child: Text(
        announcementList[index].title,
        maxLines: 2,
      )),
    );
  }

  void setList() {
    announcementList.add(new AnnouncementModel(
        photoUrl: "https://images2.gazzettaobjects.it/methode_image/2019/10/23/Calcio/Foto_Calcio_-_Trattate/LAPR0075-0057-kckH--712x402@Gazzetta-Web_712x402.JPG?v=201910231433",
        desc:
            "La formazione per sorteggio è l’ultima frontiera dell’allenatore tranquillo. Maurizio Sarri lo dice scherzando: “Chi giocherà tra Dybala e Higuain? Preferirei dirlo prima a loro, sono entrambi in buone condizioni psicofisiche. Se anche scegliessi con un sorteggio, le possibilità di sbagliare sarebbero limitate e questa è una fortuna.",
        title: "Sarri: “Che orgoglio allenare Ronaldo: mentalità eccezionale",
        date: "21 ottobre - 15:21 - MILANO"));
    announcementList.add(new AnnouncementModel(
        photoUrl: "https://images2.gazzettaobjects.it/methode_image/2019/10/21/Calcio/Foto_Calcio_-_Trattate/AFP_1LL1XG-0066-kHBD--712x402@Gazzetta-Web_712x402.jpg?v=201910211336",
        desc:
            "Ieri la rabbia, oggi la lucidità. Il giorno dopo il rischioso black-out di Reggio Emilia Antonio Conte ha analizzato nuovamente i 20 minuti finali del match con il Sassuolo. E l’ha fatto mettendo la squadra davanti al video: una prassi, il giorno dopo le partite.",
        title: "Black-out col Sassuolo? Conte piazza l’Inter davanti al video",
        date: "21 ottobre - 13:35 - MILANO"));
    announcementList.add(new AnnouncementModel(
        photoUrl: "https://images2.gazzettaobjects.it/methode_image/2019/10/21/Calcio/Foto_Calcio_-_Trattate/AFP_1LL4PO-0059-kwQH--712x402@Gazzetta-Web_712x402.jpg?v=201910211338",
        desc:
            "La vittoria non è arrivata, ma il lavoro fatto in pochi giorni da Stefano Pioli a Milanello a qualcosa è servito. Contro il Lecce non sono arrivati i tre punti, ma indicazioni confortanti su alcuni giocatori che possono (devono) essere fondamentali nel rilancio dei rossoneri in campionato. Da quelle il Milan dovrà partire per avvicinarsi alle prossime gare nel modo giusto, anche se molto resta ancora da fare.",
        title: "La cura Pioli ha già fatto bene a Piatek e Calhanoglu",
        date: "21 ottobre - 13:01 - MILANO"));
    announcementList.add(new AnnouncementModel(
        photoUrl:
            "https://images2.gazzettaobjects.it/methode_image/2019/10/21/Calcio/Foto_Calcio_-_Trattate/d0b58f907827f7930564515e3572951e-0074-k64F--712x402@Gazzetta-Web_712x402.jpg?v=201910211540",
        desc:
            "Dopo aver salutato i suoi giocatori nello spogliatoio dello Stadium (“Sono orgoglioso di voi per la partita che avete fatto” ha detto ai suoi ragazzi) ed essere rientrato a Bologna sabato notte con macchina privata, questa mattina Sinisa Mihajlovic è rientrato come previsto all’Ospedale Sant’Orsola per il terzo ciclo di terapie.",
        title: "Bologna, Mihajlovic torna in ospedale per il terzo ciclo di terapie",
        date: "21 ottobre - 14:20 - BOLOGNA"));
  }
}
