
class NavState  {
  final int currentIndex;

  const NavState({required this.currentIndex});

  factory NavState.initial() => const NavState(currentIndex: 0);

  NavState copyWith({int? currentIndex}) {
    return NavState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  
  List<Object?> get props => [currentIndex];
}
