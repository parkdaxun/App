import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gaori/class/friendListUserInfo.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class FriendsListPage extends StatefulWidget {
  final List<friendListUserInfoModel> friendsList;

  const FriendsListPage({Key? key, required this.friendsList})
      : super(key: key);

  @override
  State<FriendsListPage> createState() => _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Search(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  for (int i = 0; i < widget.friendsList.length; i++)
                  Slidable(
                      key: ValueKey(i),
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: '친구 삭제',
                          ),
                        ],
                      ),
                      child: UserList(i)),

                ]),
              ),
            ),
            NotFriend()
            // Padding(
            //   padding: const EdgeInsets.only(top: 250.0),
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(right: 10.0),
            //           child: Image.asset(
            //             'assets/image/noFriend.png',
            //             height: 100,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(top: 30.0),
            //           child: Text('친구가 없어요...',
            //               style: TextStyle(
            //                   fontSize: 15,
            //                   fontFamily: 'NotoSansKR',
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.w200)),
            //         ),
            //         Text('친구를 추가해 볼까요?',
            //             style: TextStyle(
            //                 fontSize: 17,
            //                 fontFamily: 'NotoSansKR',
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w400))
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Padding NotFriend() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 400,
          height: 66,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF9F7F7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text('${'박다은'}',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoSansKR',
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text('dadadada@gmail.com',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'NotoSansKR',
                              color: Colors.black,
                              fontWeight: FontWeight.w300)),
                    ),
                    InkWell(
                        onTap: () => _rotateDialog('박다은'),
                        child: Icon(Icons.add))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding UserList(int i) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: InkWell(
        onTap: () => alreadyFriends('${widget.friendsList[i].name}'),
        child: Container(
          width: 400,
          height: 66,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF9F7F7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text('${widget.friendsList[i].name}',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoSansKR',
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.friendsList[i].email,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'NotoSansKR',
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox Search() {
    return SizedBox(
      width: 400,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: InkWell(
              onTap: () {},
              child: Icon(
                Icons.search_rounded,
                color: Color(0xffFF00A8),
                size: 30,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Color(0xffFCD8E9),
              ),
            ),
            filled: true,
            fillColor: Color(0xffFDF7FA)),
        // style: ,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        title: const Text('친구목록',
            style: TextStyle(
                fontSize: 23,
                fontFamily: 'NotoSansKR',
                color: Colors.black,
                fontWeight: FontWeight.w500)));
  }

  void _rotateDialog(String name) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        animationType: DialogTransitionType.fadeScale,
        duration: const Duration(milliseconds: 350),
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xffECECEC),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: [
                Image.asset(
                  'assets/image/friendrequeset.png',
                  height: 70,
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                        text: name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w600),
                        children: const [
                      TextSpan(
                          text: '님께 친구 요청을 보내시겠어요?\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'NotoSansKR',
                            fontSize: 17,
                          )),
                    ])),
                const Center(
                  child: Text('한 번 건 친구 요청은 취소가 불가능합니다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'NotoSansKR',
                        fontSize: 13,
                      )),
                )
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFF3F9B),
                          elevation: 0,
                          fixedSize: Size(130, 30)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("확인"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFFFFF),
                        elevation: 0,
                        fixedSize: Size(130, 30),
                      ),
                      child: const Text(
                        "취소",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void alreadyFriends(String name) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        animationType: DialogTransitionType.fadeScale,
        duration: const Duration(milliseconds: 350),
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xffECECEC),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: [
                Image.asset(
                  'assets/image/friendsGaori.png',
                  height: 130,
                  width: 130,
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w600),
                          children: const [
                        TextSpan(
                            text: '님과 친구입니다!',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'NotoSansKR',
                              fontSize: 17,
                            )),
                      ])),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFF3F9B),
                          elevation: 0,
                          fixedSize: Size(130, 30)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("확인"),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
