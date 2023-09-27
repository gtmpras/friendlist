import 'package:flutter/material.dart';
import 'package:friend_request/provider/friend_request_provider.dart';

import 'package:provider/provider.dart';

class YourFriends extends StatefulWidget {
  const YourFriends({super.key});

  @override
  State<YourFriends> createState() => _YourFriendsState();
}

class _YourFriendsState extends State<YourFriends> {

   List<String> name=['David','John','Pranshu','Hridya','Kizz'];
  @override
  Widget build(BuildContext context) {
    final FriendProvider = Provider.of<FriendRequestProvider>(context,listen: false);
    print('Build from top.');
    return Scaffold(
      appBar: AppBar(
        title: Text('You are connected with'),
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
              itemCount: FriendProvider.Name.length,
              itemBuilder: (context, index){
                return Consumer<FriendRequestProvider>(builder: (context, value, child){
                   return ListTile(
                  onTap: (){
                    if(value.Name.contains(index.toString())){
                      value.removeItem(index.toString());
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
