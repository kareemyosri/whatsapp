part of 'story_cubit.dart';

@immutable
abstract class StoryState {}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}
class StoryError extends StoryState {}
class StorySuccess extends StoryState {}
