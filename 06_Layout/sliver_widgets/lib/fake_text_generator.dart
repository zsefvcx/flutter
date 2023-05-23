/*

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat auctor magna sed imperdiet. Vestibulum consequat lectus ac odio porttitor consequat. Vestibulum laoreet eu felis a fermentum. Duis ultricies eget ipsum in pretium. Aliquam tempor lorem nisi, sit amet luctus sem tristique eget. Ut non libero nec dolor lobortis ultrices. Maecenas viverra dui vel tortor efficitur, at maximus libero euismod.

In a arcu orci. Quisque sollicitudin, ante et ornare feugiat, odio felis sagittis ante, in placerat nibh lorem et diam. Mauris eu libero semper, sollicitudin nisi mattis, fringilla ipsum. Cras ante diam, ornare in sem eu, dapibus porta augue. Cras efficitur mollis velit in feugiat. Integer dignissim odio lacus, sed blandit arcu fringilla eget. Proin viverra gravida pharetra.

Morbi eget lectus varius, vulputate ligula ut, feugiat ante. Maecenas fermentum mauris quis maximus semper. Fusce porta in ex vitae tristique. Ut et augue ligula. In vel gravida erat. Mauris quis magna ante. Phasellus nec est eget elit blandit lacinia ut ut magna.

Fusce quis varius felis. Sed pulvinar ipsum id eros aliquet pellentesque. Pellentesque vel lorem aliquet, mollis erat a, fermentum neque. Curabitur ut lacinia justo, eget ullamcorper felis. Nulla facilisi. Suspendisse potenti. Donec scelerisque vel arcu at ullamcorper. Sed tincidunt nisl nec pretium euismod.

Pellentesque tincidunt diam dolor, eu facilisis orci semper at. Nulla in sapien dui. Sed ultrices, est eu molestie imperdiet, nibh odio tristique tellus, ut pharetra nisl sem lobortis ipsum. Vivamus sapien est, maximus vel aliquam viverra, aliquam sit amet nibh. Aliquam volutpat sapien eros, sed aliquam turpis gravida eget. Nullam euismod, augue ac bibendum finibus, ligula massa euismod justo, sed aliquam massa arcu at justo. Mauris ultrices ex in neque pulvinar, id convallis ex egestas. Vestibulum nec placerat justo, in ultrices diam. Fusce laoreet varius nunc nec volutpat.

Vivamus ligula sem, pretium tristique eros eget, tempor commodo urna. Sed quis orci vel mauris iaculis fringilla. Donec id maximus urna. Suspendisse id fermentum risus, vestibulum faucibus metus. Donec eget efficitur enim, vitae viverra orci. Donec auctor imperdiet augue eu scelerisque. Sed aliquam urna quis purus venenatis euismod. In hac habitasse platea dictumst. Pellentesque eu bibendum leo. Sed metus dolor, malesuada et consequat vitae, vulputate non quam. Donec at felis nulla. Ut rhoncus odio et arcu rutrum placerat. Aliquam efficitur consectetur velit at suscipit.

Pellentesque nec volutpat tellus. Praesent eros lectus, facilisis nec vehicula sit amet, tristique a risus. Pellentesque dapibus pellentesque laoreet. Sed at aliquam metus, sit amet finibus lorem. Vestibulum malesuada interdum convallis. Phasellus eu porttitor dolor. Donec posuere tempor urna, at viverra nibh tincidunt et. Etiam ullamcorper tellus magna, eleifend pulvinar ex ultrices vitae. Nunc non fermentum sapien, ut vulputate libero. Morbi gravida hendrerit eros sit amet blandit.
*/

import 'dart:math';

class FakeTextGenerator{

  String fake = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat auctor magna sed imperdiet. Vestibulum consequat lectus ac odio porttitor consequat. Vestibulum laoreet eu felis a fermentum. Duis ultricies eget ipsum in pretium. Aliquam tempor lorem nisi, sit amet luctus sem tristique eget. Ut non libero nec dolor lobortis ultrices. Maecenas viverra dui vel tortor efficitur, at maximus libero euismod. '
  'In a arcu orci. Quisque sollicitudin, ante et ornare feugiat, odio felis sagittis ante, in placerat nibh lorem et diam. Mauris eu libero semper, sollicitudin nisi mattis, fringilla ipsum. Cras ante diam, ornare in sem eu, dapibus porta augue. Cras efficitur mollis velit in feugiat. Integer dignissim odio lacus, sed blandit arcu fringilla eget. Proin viverra gravida pharetra. '
  'Morbi eget lectus varius, vulputate ligula ut, feugiat ante. Maecenas fermentum mauris quis maximus semper. Fusce porta in ex vitae tristique. Ut et augue ligula. In vel gravida erat. Mauris quis magna ante. Phasellus nec est eget elit blandit lacinia ut ut magna.'
  'Fusce quis varius felis. Sed pulvinar ipsum id eros aliquet pellentesque. Pellentesque vel lorem aliquet, mollis erat a, fermentum neque. Curabitur ut lacinia justo, eget ullamcorper felis. Nulla facilisi. Suspendisse potenti. Donec scelerisque vel arcu at ullamcorper. Sed tincidunt nisl nec pretium euismod.'
  'Pellentesque tincidunt diam dolor, eu facilisis orci semper at. Nulla in sapien dui. Sed ultrices, est eu molestie imperdiet, nibh odio tristique tellus, ut pharetra nisl sem lobortis ipsum. Vivamus sapien est, maximus vel aliquam viverra, aliquam sit amet nibh. Aliquam volutpat sapien eros, sed aliquam turpis gravida eget. Nullam euismod, augue ac bibendum finibus, ligula massa euismod justo, sed aliquam massa arcu at justo. Mauris ultrices ex in neque pulvinar, id convallis ex egestas. Vestibulum nec placerat justo, in ultrices diam. Fusce laoreet varius nunc nec volutpat. '
  'Vivamus ligula sem, pretium tristique eros eget, tempor commodo urna. Sed quis orci vel mauris iaculis fringilla. Donec id maximus urna. Suspendisse id fermentum risus, vestibulum faucibus metus. Donec eget efficitur enim, vitae viverra orci. Donec auctor imperdiet augue eu scelerisque. Sed aliquam urna quis purus venenatis euismod. In hac habitasse platea dictumst. Pellentesque eu bibendum leo. Sed metus dolor, malesuada et consequat vitae, vulputate non quam. Donec at felis nulla. Ut rhoncus odio et arcu rutrum placerat. Aliquam efficitur consectetur velit at suscipit. '
  'Pellentesque nec volutpat tellus. Praesent eros lectus, facilisis nec vehicula sit amet, tristique a risus. Pellentesque dapibus pellentesque laoreet. Sed at aliquam metus, sit amet finibus lorem. Vestibulum malesuada interdum convallis. Phasellus eu porttitor dolor. Donec posuere tempor urna, at viverra nibh tincidunt et. Etiam ullamcorper tellus magna, eleifend pulvinar ex ultrices vitae. Nunc non fermentum sapien, ut vulputate libero. Morbi gravida hendrerit eros sit amet blandit. ';


  int numParagraph;

  List<String> _result = [];


  List<String> get result => _result;

  FakeTextGenerator(this.numParagraph){
    for (int i = 0; i < numParagraph; i++){
      _result.add(fake);
    }
    print(result);
  }

  @override
  String toString() {
    return _result.join('\n');
  }
}
