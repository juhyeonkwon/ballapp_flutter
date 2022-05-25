
import 'package:flutter/material.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({Key? key}) : super(key: key);

  @override
  State<LearnFlutter> createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> with AutomaticKeepAliveClientMixin<LearnFlutter> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children : [
        RowWidget(),
        ColumnWidget(),
        DesignSample(),
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceEvenly,

          children: [
            Column(
              mainAxisAlignment : MainAxisAlignment.spaceEvenly,
              children: [
                ContainerMargin(),
                ContainerMargin(),
              ],
            ),
            Column(
              children: [
                ContainerMargin(),
                ContainerMargin(),
              ],
            ),
          ],
        ),
        ParentWidget(),
      ],
    );
  }
}


class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child : Image.asset('assets/images/cat1.jpg', ),
        ),
        Expanded(
          child : Image.asset('assets/images/cat2.jpg', ),
          flex: 2,
        ),
        Expanded(
          child : Image.asset('assets/images/cat3.jpg', ),
        ),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/cat1.jpg',   width: width,),
        Image.asset('assets/images/cat2.jpg',  width: width,),
        Image.asset('assets/images/cat3.jpg',  width: width,),
        StartWidgets(),
      ],
    );
  }
}

class StartWidgets extends StatelessWidget {
  const StartWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500],),
        Icon(Icons.star, color: Colors.green[500],),
        Icon(Icons.star, color: Colors.green[500],),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );


    return Container(
      child: Row(
        children: [
          Expanded(
            flex : 2,
            child : Column(
            children: [
              Text("딸기 제목", style: TextStyle(fontWeight: FontWeight.bold),),
              Text("배고프다 딸기먹고싶다 베라 베리베리스트로베리ㅏ먹고싶다",),
              Row(
                children: [
                  stars,
                  Text("211개의 리뷰가 있다"),
                ],
              )
            ],
          ),),
          Expanded(
            flex: 1,
              child : Column(
                children: [
                  Image.asset('assets/images/cat1.jpg'),
                ],
              )
          )
        ],
      ),
    );
  }
}


class ContainerMargin extends StatelessWidget {
  const ContainerMargin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(width: 1, color: Colors.white),
      ),
      margin: EdgeInsets.all(10.0),
      child: Image.asset('assets/images/cat1.jpg', width: 172,),
    );
  }
}

class DesignSample extends StatelessWidget {
  const DesignSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    return Column(
      children: [
        TitleSection(),
        buttonSection,
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}

class TitleSection extends StatefulWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
          Text('$_favoriteCount'),
        ],
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>  with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  bool isActive = false;
  int i = 0;

  void onChange() {
    setState(() {
      isActive = !isActive;
      i = i + 1;
    });
  }

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$i"),
        ChildWidget(isActive : isActive, onChange: onChange),
      ],
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({Key? key, this.isActive = false, required this.onChange}) : super(key: key);

  final bool isActive;
  final VoidCallback onChange;


  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onChange, child: Text("버튼"));
  }
}