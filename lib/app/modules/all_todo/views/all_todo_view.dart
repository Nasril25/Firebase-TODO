import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase/app/modules/all_todo/controllers/all_todo_controller.dart';
import 'package:flutter_crud_firebase/app/routes/app_pages.dart';
import 'package:flutter_crud_firebase/app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllTodoView extends GetView<AllTodoController> {
  const AllTodoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Data Todo',
          style: TextStyle(
            color: AppColor.secondary,
            fontSize: 14,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: GetBuilder<AllTodoController>(
        builder: (con) {
          return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: controller.getAllResult(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                var data = snapshot.data!.docs;
                return ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                   var todoData = data[index].data();
                   return InkWell(
                    onTap: () => {
                      Get.toNamed(
                        Routes.DETAIL_TODO,
                        arguments: {
                          "id": "${todoData["task_id"]}",
                          "title": "${todoData["title"]}",
                          "description": "${todoData["description"]}",
                        },
                      )
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: AppColor.primaryExtraSoft,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: 24, top: 24, right: 29, bottom: 20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (todoData["title"] == null)
                            ? "-"
                            : "${todoData["title"]}",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "${todoData["created_at"]}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      ],
                    ),
                    ),
                   );
                  },
                );
                default: 
                return SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}