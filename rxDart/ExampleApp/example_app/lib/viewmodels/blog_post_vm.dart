import 'dart:async';

import 'package:example_app/models/blog_post.dart';

class BlogPostViewModel {
  StreamController<List<BlogPost>> _blogPostStreamController =
      StreamController.broadcast();

  Stream<List<BlogPost>> get outBlogPostList =>
      _blogPostStreamController.stream;

  Sink<List<BlogPost>> get _inBlogPost => _blogPostStreamController.sink;

  late List<BlogPost> _blogPosts;

  BlogPostViewModel() {
    outBlogPostList.listen((data) {
      _blogPosts = data;
    });

    Future.delayed(Duration(seconds: 3)).then((_) => {
          _inBlogPost.add([
            BlogPost(
                id: 1,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 1'),
            BlogPost(
                id: 2,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 2'),
            BlogPost(
                id: 3,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 3'),
            BlogPost(
                id: 4,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 4'),
            BlogPost(
                id: 5,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 5'),
            BlogPost(
                id: 6,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 6'),
            BlogPost(
                id: 7,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 7'),
            BlogPost(
                id: 8,
                author: 'Author',
                content:
                    'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
                publishDate: DateTime.now(),
                title: 'Blog Post 8')
          ])
        });
  }

  void addBlogPost(BlogPost blogPost) {
    _blogPosts.add(blogPost);
    _inBlogPost.add(_blogPosts);
  }

  void updateBlogPosts(BlogPost blogPost){
    final index = _blogPosts.indexOf(
      _blogPosts.where((bp) => bp.id == blogPost.id).first
    );

    _blogPosts[index] = blogPost;
    _inBlogPost.add(_blogPosts);
  }

  void deleteBlogPost(int id) {
    _blogPosts.removeWhere((bp) => bp.id == id);
    _inBlogPost.add(_blogPosts);
  }
}
