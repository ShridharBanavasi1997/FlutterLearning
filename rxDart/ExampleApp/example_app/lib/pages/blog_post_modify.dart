
import 'dart:math';

import 'package:example_app/models/blog_post.dart';
import 'package:example_app/viewmodels/blog_post_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BlogPageModify extends StatelessWidget{
  final BlogPost? blogPost;

  bool get isEditing => blogPost != null ;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  BlogPageModify({this.blogPost}){
    if(isEditing){
      _titleController.text = blogPost!.title;
      _contentController.text = blogPost!.content;
      _authorController.text = blogPost!.author;
    }
  }
  BlogPostViewModel get _vm => GetIt.I<BlogPostViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit blog post' : 'Create blog post'),
        elevation: 0.0,
        actions: <Widget>[
          isEditing ? IconButton(
              onPressed: (){
                _vm.deleteBlogPost(blogPost!.id);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete)
          ): Container()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:12.0,right: 12.0,top: 8.0,bottom: 8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            Container(height: 12,),
            TextField(
                controller: _contentController,
                decoration: InputDecoration(hintText: 'Content')
            ),
            Container(height: 12,),
            TextField(
                controller: _authorController,
                decoration: InputDecoration(hintText: 'Author')
            ),
            Container(height: 12,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  final blogPost = BlogPost(
                    title: _titleController.text,
                    content: _contentController.text,
                    author: _authorController.text,
                    id: isEditing ? this.blogPost!.id : Random().nextInt(10000),
                    publishDate: DateTime.now()
                  );
                  if(isEditing){
                    _vm.updateBlogPosts(blogPost);
                  }else{
                    _vm.addBlogPost(blogPost);
                  }
                  Navigator.of(context).pop();
                },
                  color: Theme.of(context).primaryColor,
                  child: Text('Save', style: TextStyle(color: Colors.white))
              ),
            )
          ],
        ),
      ),
    );
  }

}