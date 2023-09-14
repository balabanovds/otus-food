import 'package:flutter/material.dart';

import '../domain/model/comment.dart';
import '../domain/repository/provider.dart';

class CommentsView extends StatefulWidget {
  final int id;

  const CommentsView({super.key, required this.id});

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  List<Comment> _items = [];
  final _commentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData(provider);
  }

  Future<void> loadData(CommentsProvider provider) async {
    var data = await provider.comments(widget.id);
    setState(() {
      _items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 37,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          _items.isEmpty
              ? const SizedBox()
              : Column(
                  children: _items.map((e) => _CommentView(item: e)).toList(),
                ),
          const SizedBox(
            height: 48,
          ),
          TextFormField(
            maxLines: 2,
            controller: _commentCtrl,
            decoration: InputDecoration(
              labelText: 'оставить комментарий',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 194, 194, 194),
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              alignLabelWithHint: true,
              suffixIcon: IconButton(
                iconSize: 24,
                color: const Color.fromARGB(255, 22, 89, 50),
                onPressed: () {},
                icon: const Icon(Icons.image),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Color.fromARGB(255, 22, 89, 50), width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Color.fromARGB(255, 22, 89, 50), width: 2.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}

class _CommentView extends StatelessWidget {
  final Comment item;

  const _CommentView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 16,
          fit: FlexFit.tight,
          child: Container(
            height: 63,
            width: 63,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: item.user.image(BoxFit.cover),
          ),
        ),
        const Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: SizedBox(),
        ),
        Flexible(
          flex: 80,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.user.name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 46, 204, 113),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    item.createdAtDate,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                item.text,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 160,
                child: item.image(BoxFit.cover),
              )
            ],
          ),
        )
      ],
    );
  }
}
