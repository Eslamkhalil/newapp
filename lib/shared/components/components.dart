import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

Widget buildItemList(article) => ConditionalBuilder(
      condition: article.length > 0,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              child: Image.network('${article['urlToImage']}',scale: 1.0,),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${article['title']}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  )),
                  Text('${article['publishedAt']}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                          color: Colors.grey)),
                ],
              ),
            )),
          ],
        ),
      ),
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget defaultFormField({TextEditingController controller, String hint, Function onTap, IconData icon, Function onChange}) => TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      validator: (value) {
        if (value.isEmpty) {
          return '$hint must be provided';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.red,
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal:16.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: hint,
      ),
    );

void navigateTo({@required context, @required Widget widget}){
  Navigator.push(context,MaterialPageRoute(
    builder: (context) => widget
  ));
}
