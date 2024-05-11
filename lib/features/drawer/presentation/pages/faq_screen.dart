import 'package:chat_gpt/core/theme/colors.dart';
import 'package:chat_gpt/features/drawer/presentation/widgets/faq_item.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        title: const Text('FAQ'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          FAQItem(
            question: 'What is ChatGPT?',
            answer:
                'ChatGPT is an AI language model developed by OpenAI that can understand and generate human-like text based on the input it receives.',
          ),
          FAQItem(
            question: 'How does ChatGPT work?',
            answer:
                'ChatGPT works by processing input text, understanding the context, and generating responses based on its training data.',
          ),
          FAQItem(
            question: 'Can ChatGPT understand different languages?',
            answer:
                'Yes, ChatGPT can understand and generate text in multiple languages, including English.',
          ),
          FAQItem(
            question: 'Is ChatGPT always accurate?',
            answer:
                'While ChatGPT strives to generate accurate responses, it may occasionally produce incorrect or nonsensical outputs, especially with complex or ambiguous queries.',
          ),
          // Add more questions and answers as needed
        ],
      ),
    );
  }
}
