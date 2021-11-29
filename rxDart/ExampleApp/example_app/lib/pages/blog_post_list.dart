import 'package:example_app/models/blog_post.dart';
import 'package:example_app/viewmodels/blog_post_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:example_app/pages/blog_post_modify.dart';

class BlogPostList extends StatelessWidget {
  BlogPostViewModel get _vm => GetIt.I<BlogPostViewModel>();

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Post'),
        elevation: 2.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme
            .of(context)
            .primaryColor,
        elevation: 30.0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => BlogPageModify()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: StreamBuilder<List<BlogPost>>(
          stream: _vm.outBlogPostList,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final blogPosts = snapshot.data;

            return ListView.builder(
                itemCount: blogPosts!.length,
                itemBuilder: (BuildContext context, int index) {
                  final blogPost = blogPosts[index];

                  return Padding(
                    padding: const EdgeInsets.only(left:12,right: 12,top: 8,bottom: 8),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlogPageModify(blogPost: blogPost,)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              blogPost.title,
                              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Container(height: 4.0,),
                            Text(
                              formatDate(blogPost.publishDate),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        decoration:BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        )
                      ),
                    ),
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
