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
          style={{ flex: 1, justifyContent: "flex-start", paddingTop: "35%" }}
        >
          <View
            style={{
              flexDirection: "row",
              height: 90,
              width: "100%",
              alignItems: "flex-start",
              justifyContent: "flex-start",
              gap: 10,
            }}
          >
            <Button
              height={50}
              width={50}
              icon={"chevron-left"}
              secondary
              rounded
              onPress={() => {
                Keyboard.dismiss();
                setSearch("");
              }}
            />
            <TextInput
              style={{
                width: "80%",
                height: 50,
                borderRadius: 100,
                padding: 15,
                backgroundColor: "rgb(232, 232, 232)",
              }}
              placeholder="Pra onde deseja viajar?"
              onFocus={() => {}}
              onChangeText={(text) => setSearch(text)}
              value={search}
            />
          </View>
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
