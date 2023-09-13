import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:todoapp/features/home/data/repositories/location_repository.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/widgets/find_location_bottom_sheet/cubits/find_location_bloc/find_location_bloc.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/widgets/find_location_bottom_sheet/cubits/find_location_bloc/find_location_state.dart';

class FindLocationBottomSheet extends StatelessWidget {
  const FindLocationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Text('Find location',
                style: Theme.of(context).textTheme.headlineMedium),
            const Divider(height: 1, thickness: 1),
            const Expanded(child: _Body()),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FindLocationBloc(
          locationRepository: context.read<LocationRepository>()),
      child: BlocBuilder<FindLocationBloc, FindLocationState>(
        builder: (context, state) {
          return state.when(
            error: () => const Text('Error ups'),
            loaded: (placeSuggestions) => _Loaded(
              searchOnChange: context.read<FindLocationBloc>().searchOnChange,
              placePredictions: placeSuggestions,
            ),
          );
        },
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  const _Loaded({
    Key? key,
    required this.searchOnChange,
    required this.placePredictions,
  }) : super(key: key);

  final Function(String) searchOnChange;
  final List<Prediction> placePredictions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextFormField(
            onChanged: searchOnChange,
            autofocus: true,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(child: _ResultList(placePredictions: placePredictions)),
      ],
    );
  }
}

class _ResultList extends StatelessWidget {
  const _ResultList({
    Key? key,
    required this.placePredictions,
  }) : super(key: key);

  final List<Prediction> placePredictions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: placePredictions.length,
      itemBuilder: (context, index) {
        return _SingleResult(placePrediction: placePredictions[index]);
      },
    );
  }
}

class _SingleResult extends StatelessWidget {
  const _SingleResult({
    Key? key,
    required this.placePrediction,
  }) : super(key: key);

  final Prediction placePrediction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Divider(height: 1, thickness: 1),
          const SizedBox(height: 8),
          ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              // title: Text(placePrediction.description.split(', ').last),
              title: Text(placePrediction.description ?? 'No description'),
              onTap: () async {
                if (placePrediction.placeId != null) {
                  final PlaceDetails result = await context
                      .read<LocationRepository>()
                      .getDetailsOfPlaceId(placePrediction.placeId!);

                  Navigator.pop(context, result);
                }
              }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
