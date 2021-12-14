import 'package:bloc/bloc.dart';
import 'package:comments_app/bloc/comments_event.dart';
import 'package:comments_app/bloc/comments_state.dart';
import 'package:comments_app/data/data_provider/comments_data_provider.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsDataProvider commentsDataProvider = CommentsDataProvider();

  CommentsBloc() : super(const CommentsState()) {
    on<CommentsFetched>(_onFetched);
  }

  Future<void> _onFetched(
    CommentsFetched event,
    Emitter<CommentsState> emit,
  ) async {
    try {
      if (state.commentsStatus == CommentsStatus.initial) {
        final posts = await commentsDataProvider.fetchComments();
        return emit(state.copyWith(
          commentsStatus: CommentsStatus.success,
          comments: posts,
        ));
      }
    } catch (_) {
      emit(state.copyWith(commentsStatus: CommentsStatus.failure));
    }
  }
}
