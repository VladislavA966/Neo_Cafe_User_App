import 'package:neo_cafe_24/features/branches/data/model/branch_model.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';

extension BranchModelMapper on BranchModel {
  BranchEntity toDomain() {
    return BranchEntity(
      id: id ?? 0,
      schedules: schedules
              ?.map((s) => SchedulesEntity(
                    day: s.day ?? 'Unknown day',
                    startTime: s.startTime ?? '00:00',
                    endTime: s.endTime ?? '00:00',
                  ))
              .toList() ??
          [],
      branchName: branchName ?? 'Unknown branch',
      adress: adress ?? 'Unknown address',
      phoneNumber: phoneNumber ?? 'No phone',
      image: image ?? 'No image',
      description: description ?? 'No description',
      link2gis: link2gis ?? 'No link',
      tableQuantity: tableQuantity ?? 0,
    );
  }
}
