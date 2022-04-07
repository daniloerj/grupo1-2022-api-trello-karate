 function iterator(array) {

      var print='';

      for (let index = 0; index < array.length; index++) {
          print = print + ' ' + array[index].name;
      }

      return print;

    }