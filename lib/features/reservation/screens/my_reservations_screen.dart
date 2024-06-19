import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snowmakers/core/utilities/extensions.dart';
import 'package:snowmakers/features/reservation/providers/reservations_notifier.dart';

class MyReservationScreen extends ConsumerWidget {
  const MyReservationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationsState = ref.watch(ReservationsNotifier.provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Reservations',
        ),
      ),
      body: FadeIn(
        child: reservationsState.when(
          data: (reservations) {
             if (reservations.isEmpty) {
              return const Center(
                child: Text('No reservations found'),
              );
            } else {
              return ListView.builder(
                itemCount: reservations.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.calendar_month),
                        title: Text(
                          "Unit ID: ${reservations[index].unitId}",
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          'User: ${reservations[index].name}',
                          maxLines: 1,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        dense: false,
                        onTap: () {
                          context.push(
                            '/editReservation',
                            extra: reservations[index].toJson(),
                          );
                        },
                      ),
                      if (index != reservations.length - 1)
                        Divider(
                          color: context.appTheme.white.withOpacity(0.2),
                        ),
                    ],
                  );
                },
              );
            }
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e) => Center(
            child: Text(
              e.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
