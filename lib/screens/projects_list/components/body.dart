import 'package:flutter/material.dart';
import 'package:shop_app/models/ApiResponse.dart';
import '../../../models/Project.dart';
import '../../../services/project_service.dart';
import '../../../size_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends  State<Body> {

  List<dynamic> proj = [];

  Future<void> getProject() async {
    ApiResponse response= await getUserProjects();
    setState(() {
      proj = response.data as List<dynamic>;
    });
  }

  @override
   initState() {
    getProject();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10,),
      child: ListView.builder(
        itemCount: proj.length,
        itemBuilder: (BuildContext context, i) {
          return Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(15)),
              Slidable(
                // Specify a key if the Slidable is dismissible.
                key: ValueKey(0),
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) async {

                      },
                      backgroundColor: Colors.lightBlue.shade400,
                      foregroundColor: Colors.white,
                      icon: Icons.email_outlined,
                      label: 'send mail',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'delete',
                    ),
                  ],
                ),
                child: Card(
                  color: Colors.lightBlue[50],
                  elevation: 10,
                  child:
                  ExpansionTile(
                    title: Text('${proj[i]['Pr_Name']}'),
                    subtitle: Text('${proj[i]['Anee']}'),
                    children: [
                      ListTile(
                        title: Text('details'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}

