import 'dart:developer';

import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/search/search_bloc.dart';
import '../home%20screen/widgets/floating_add_button.dart';
import 'widgets/list_container.dart';
import '../home%20screen/widgets/search_field.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  TextEditingController controller = TextEditingController();

  bool samp = false;

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(SearchStudent(searchString: ''));

    Size size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0Xff480ca8),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 65),
              child: SearchField(
                controller: controller,
                searchfunc: (value) {
                  context
                      .read<SearchBloc>()
                      .add(SearchStudent(searchString: value));
                  // log(value);
                },
              )),
          floatingActionButton: const DraggableFab(child: FloatingAddButton()),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              // context.read<ListStudentsBloc>().add(CallStudentsdata());
              log('building');

              return state.studentsList.isEmpty
                  ? const Center(
                      child: Text(
                        'No lists found',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final data = state.studentsList[index];
                        return ListContainer(
                            size: size, data: data, index: index);
                      },
                      itemCount: state.studentsList.length,
                    );
            },
          ),
        ),
      ),
    );
  }
}
