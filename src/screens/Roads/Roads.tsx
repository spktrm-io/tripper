import {
  View,
  TextInput,
  Keyboard,
  TouchableWithoutFeedback,
  FlatList,
} from "react-native";
import React, { useState } from "react";
import { roadsStyles } from "./styles";
import Header from "../../components/molecules/Header/Header";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import CardItemRoad from "../../components/molecules/CardItemRoadList/CardItemRoadList";
import Button from "../../components/atoms/Button/Button";
import { placeList } from "../../mock/placesList";
import SearchBar from "../../components/molecules/SearchBar/SearchBar";

const Roads = () => {
  const [search, setSearch] = useState<string>("");
  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();

  return (
    <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
      <View style={roadsStyles.container}>
        <Header
          rightButtonProps={{
            icon: "chevron-right",
            navigation: () => navigation.goBack(),
          }}
          centerButtonProps={{
            text: "Roads",
            navigation: () => navigation.goBack(),
          }}
        />
        <View
          style={{
            flex: 1,
            justifyContent: "flex-start",
            paddingTop: "35%",
            gap: 20,
          }}
        >
          <SearchBar
            onPress={() => null}
            onPressExit={() => null}
            searchValue={search}
            setSearchValue={setSearch}
          />
          <FlatList
            data={placeList}
            renderItem={({ item }) => (
              <CardItemRoad item={item} navigation={navigation} />
            )}
            keyExtractor={(item) => item.id}
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default Roads;
