import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import Modalize from "react-native-modalize";

const SearchBar = () => {
  let modalRef = null;

  const openBottomSheet = () => {
    if (modalRef) {
      modalRef.open();
    }
  };

  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
      <TouchableOpacity onPress={openBottomSheet}>
        <Text>Open Bottom Sheet</Text>
      </TouchableOpacity>

      <Modalize
        ref={(ref) => (modalRef = ref)}
        adjustToContentHeight // Isso permite que o conteúdo do BottomSheet determine a altura
        panGestureEnabled // Isso habilita a capacidade de arrastar com o dedo
      >
        {/* Conteúdo do seu BottomSheet */}
        <View style={{ padding: 20 }}>
          <Text>Conteúdo do Bottom Sheet</Text>
          <Text>Outros elementos podem ser adicionados aqui</Text>
        </View>
      </Modalize>
    </View>
  );
};

export default SearchBar;
