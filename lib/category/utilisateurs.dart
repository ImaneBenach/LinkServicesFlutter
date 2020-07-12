
import 'package:flutter/material.dart' ;
import 'package:flutter/src/widgets/framework.dart';

class Utilisateurs extends StatefulWidget {
  @override
  _UtilisateursState createState() => _UtilisateursState();

}

class _UtilisateursState extends State<Utilisateurs> {
  int utilisateurCart = 0;

   List<String> Category = ['Utilisateurs','Justificatifs','Signalement','Avertissement','Profil'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, costr) {
        var count = 4 ;
        if(costr.maxWidth > 1200 ) count = 8 ;
        return Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text("Utilisateurs",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                    Expanded(child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          hintText: "Rechercher...",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)
                        )
                        ),
                      ),
                    )),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.filter_list),
                    )
                    ],
                ),
              ),
              Expanded(
                  child: Row(
                  children: <Widget>[
                      Container(
                        width: 150.0,
                        child: ListView.builder(
                          itemBuilder: (context,index)=>EachList(this.Category[index]),
                          itemCount: Category.length,
                          ),
                        ),
                    Expanded(
                        child: GridView.builder(
                          itemCount: utilisateurs.length,
                        itemBuilder: (context, index) => utilisateursView(utilisateurs[index]),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: count, 
                          childAspectRatio: 1.3/2.5),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          )
          
        );
      }
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: Center(
        child: FlutterLogo(), 
      ),
      iconTheme: IconThemeData(color: Colors.black, ),
      actions: <Widget>[
        Container(
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {},
              ),
              CircleAvatar(
                radius:10.0,
                backgroundColor: Colors.red,
                child: Text(
                "$utilisateurCart", 
                style: TextStyle(color: Colors.white),
              
                ),
              ),
            ],
          ),
        ),
      ],
      title: Text("Link Services", style: TextStyle(
        color: Colors.black
        ),
      ),
    );
  }

  Widget utilisateursView(UtilisateurModel utilisateurModel) {
    return Card(
          child: Column(
        children: <Widget> [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(""),
                fit: BoxFit.cover, 

              )
            
            ),
  
          ),
          Text("${utilisateurModel.name}"),
          Text("${utilisateurModel.id}"), 
          RaisedButton(
            color: !utilisateurModel.banni ? Colors.red: Colors.orange,
            child: Text( !utilisateurModel.banni ? "Bannir" : " Banni avec succès", 
            style: TextStyle(
              color: Colors.white,
            ),),
            onPressed: (){
              setState((){
                utilisateurModel.banni = !utilisateurModel.banni ;
                if(utilisateurModel.banni) utilisateurCart++ ; 
                else utilisateurCart--;
              });
            },
          )
        ],
      ),
    );

  }

  List<UtilisateurModel> utilisateurs = [
    UtilisateurModel(name: "Username 1 ", id: "id : 1"),
    UtilisateurModel(name: "Username 2 ", id: "id : 2"),
    UtilisateurModel(name: "Username 3 ", id: "id : 3"),
    UtilisateurModel(name: "Username 4 ", id: "id : 4"),
    UtilisateurModel(name: "Username 5 ", id: "id : 5"),
    UtilisateurModel(name: "Username 6 ", id: "id : 6"),
    UtilisateurModel(name: "Username 7 ", id: "id : 7"),
  ];
}

class UtilisateurModel{
  String name;
  String id;
  bool banni ;
  UtilisateurModel({this.name, this.id, this.banni = false}) ;

}

class EachList extends StatelessWidget{
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(child: new Text(name[0]),),
            new Padding(padding: EdgeInsets.only(right:8.0)),
            new Text(name,style: TextStyle(fontSize: 11.5),)
          ],
        ),
      ),
    );
  }
}