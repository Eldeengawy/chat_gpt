import 'package:chat_gpt/features/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/existing_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsHistoryWidget extends StatelessWidget {
  const ChatsHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<DrawerCubit, DrawerState>(
          builder: (BuildContext context, DrawerState state) {
        if (state is ChatsLoaded) {
          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) =>
                ExistingChatWidget(chat: state.chats[index]),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
