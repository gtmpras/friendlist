import 'package:flutter/material.dart';
import 'package:friend_request/friends_page.dart';
import 'package:friend_request/provider/friend_request_provider.dart';
import 'package:provider/provider.dart';

class FriendRequest extends StatefulWidget {
  const FriendRequest({super.key});

  @override
  State<FriendRequest> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
  
  List<String> name=['David','John','Pranshu','Hridya','Kizz'];
  @override
  Widget build(BuildContext context) {
    print('Build from top.');
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Friends'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> YourFriends()));
            },
            child: Icon(Icons.people),
          ),
          SizedBox(width: 20,)
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index){
                return Consumer<FriendRequestProvider>(builder: (context, value, child){
                   return ListTile(
                  onTap: (){
                    if(value.Name.contains(name[index].toString())){
                      value.removeItem(name[index].toString());
                    }else{
                      value.addItem(index.toString());
                    }
                  },
                  leading:const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                    backgroundImage: NetworkImage('https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg'),
                    radius: 35,
                    ),
                  ),
                  title: Text(name[index].toString()),
                  trailing: Icon(value.Name.contains(index.toString())?Icons.add_circle_rounded :Icons.add_circle_outline),
                );
            });
                }),
               
          ),
          
        ],
      ),
    );
  }
}