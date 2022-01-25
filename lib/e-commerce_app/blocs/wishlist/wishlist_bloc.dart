import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/e-commerce_app/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapWishlistStartedToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapWishlistProductAddedToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapWishlistProductRemovedToState(event, state);
    }
  }

  Stream<WishlistState> _mapWishlistStartedToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistLoaded();
    } catch (_) {
      yield WishlistError();
    }
  }

  Stream<WishlistState> _mapWishlistProductAddedToState(
    AddWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        );
      } on Exception {
        yield WishlistError();
      }
    }
  }

  Stream<WishlistState> _mapWishlistProductRemovedToState(
    RemoveWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } on Exception {
        yield WishlistError();
      }
    }
  }
}
