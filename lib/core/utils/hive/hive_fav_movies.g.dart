// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_fav_movies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavMoviesAdapter extends TypeAdapter<FavMovies> {
  @override
  final int typeId = 0;

  @override
  FavMovies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavMovies(
      id: fields[0] as int?,
      posterPath: fields[1] as String?,
      releaseDate: fields[2] as String?,
      title: fields[3] as String?,
      voteAverage: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, FavMovies obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavMoviesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
