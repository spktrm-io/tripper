import styled from "styled-components/native";

export const Button = styled.TouchableOpacity`
  background-color: ${(props) =>
    props.disabled ? "rgb(139, 185, 255)" : "rgb(48, 131, 255)"};
  padding: 15px;
  width: 90%;
  align-items: center;
  border-radius: 5px;
  color: white;
`;

export const ButtonText = styled.Text`
  color: white;
  font-weight: 800;
  font-size: 15px;
`;
