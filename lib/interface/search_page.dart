import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_health/common/style.dart';
import 'package:yum_health/data/database/firestore/resep_db_service.dart';
import 'package:yum_health/data/model/resep_model.dart';
import 'package:yum_health/helper/state_helper.dart';
import 'package:yum_health/interface/detail_page.dart';
import 'package:yum_health/provider/search_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
        create: (context) => SearchProvider(dbService: DatabaseService()),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text('Search', style: myTextTheme.caption),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Consumer<SearchProvider>(builder: (context, snapshot, child) {
              return Column(
                children: [
                  TextField(
                    controller: _controller,
                    style: myTextTheme.subtitle1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: 'search here...',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: secondaryColor, width: 3),
                      ),
                    ),
                    cursorColor: secondaryColor,
                    onSubmitted: (input) => snapshot.searchData(input),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(child: list(context, snapshot))
                ],
              );
            }),
          ),
        ));
  }

  Widget list(BuildContext context, SearchProvider snapshot) {
    if (snapshot.state == ResultState.noInput) {
      return const Center(
        child: Text(''),
      );
    } else if (snapshot.state == ResultState.hasData) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: snapshot.listData.length,
        itemBuilder: (context, index) =>
            _listItem(context, snapshot.listData[index]),
      );
    } else if (snapshot.state == ResultState.noData) {
      return Center(
        child: Text(
          'Resep yang anda cari tidak ditemukan',
          style: myTextTheme.subtitle1,
        ),
      );
    } else if (snapshot.state == ResultState.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    } else {
      return Center(
        child: Text(
          'Error',
          style: myTextTheme.subtitle1,
        ),
      );
    }
  }

  Widget _listItem(BuildContext context, ResepData resep) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName, arguments: resep);
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          height: 118,
          child: Card(
            color: const Color(0xFFF1F1F1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 80,
                  margin: const EdgeInsets.only(bottom: 9, top: 9, left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(resep.imageLink),
                        fit: BoxFit.cover),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resep.name,
                          style: myTextTheme.headline5,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          resep.description,
                          style: myTextTheme.subtitle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
