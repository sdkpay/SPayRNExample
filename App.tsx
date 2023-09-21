/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import type {PropsWithChildren} from 'react';
import SPayButton from './SPayButtonView.js';
import SPayBridgeModule from './SPayBridgeModule';
import {
  Alert,
  Button,
  NativeModules,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  View,
  TouchableHighlight
} from 'react-native';

import {
  Colors
} from 'react-native/Libraries/NewAppScreen';

type SectionProps = PropsWithChildren<{
  title: string;
}>;

function Section({children, title}: SectionProps): JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';
  return (
    <View style={styles.sectionContainer}>
      <Text
        style={[
          styles.sectionTitle,
          {
            color: isDarkMode ? Colors.white : Colors.black,
          },
        ]}>
        {title}
      </Text>
      { children }
    </View>
  );
}

function App(): JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
    <SafeAreaView style={backgroundStyle}>
    <StatusBar
      barStyle={isDarkMode ? 'light-content' : 'dark-content'}
      backgroundColor={backgroundStyle.backgroundColor}
    />
    <ScrollView
      contentInsetAdjustmentBehavior="automatic"
      style={backgroundStyle}>
         <Section title="Setup methods:">
            <Button 
              title='Setup action'
              onPress={ setupSDK }
            />
            <Button 
              title='isReadyForSPay action'
              onPress={ isReadyForSPay }
            />
          </Section>
          <Section title="Auto pay methods:">
            <Button 
              title='payWithBankInvoiceId action'
              onPress={ payWithBankInvoiceId }
              />
          </Section>
          <Section title="Manual pay methods:">
            <Button 
              title='PaymentToken action'
              onPress={ getPaymentToken }
              />
              <Button 
              title='Pay action'
              onPress={ pay }
              />
              <Button 
              title='Manual close action'
              onPress={ close }
              />
          </Section>
          <Section title="Native button:">
         </Section>
    </ScrollView>
    <TouchableHighlight onPress={onPressSPayButton} underlayColor="white">
        <SPayButton style={{
        height: 100,
        paddingHorizontal: 16
        }}
      />
     </TouchableHighlight>
    </SafeAreaView>
  );
}
  

function setupSDK() {
  SPayBridgeModule.setupSDK( () => {
    Alert.alert(`setup complited`)
  })
}

function isReadyForSPay() {
  SPayBridgeModule.isReadyForSPay( 
    (isReady: boolean) => {
      Alert.alert(`is ready for spay: ${isReady}`)
  })
}

function payWithBankInvoiceId() {
  var requestParams = {
    'merchantLogin': 'Test shop',
    'bankInvoiceId': '1233',
    'redirectUri': 'sberPayExampleapp://sberidauth'
  }

  SPayBridgeModule.payWithBankInvoiceId(
    requestParams,
    (error: any, event: string) => {
      if(error) {
        Alert.alert(`Error found! ${error}`)
      }
        Alert.alert(`Pay with status: ${event}`)
    })
}

function getPaymentToken() {
  var requestParams = {
    'merchantLogin': 'Test shop',
    'amount': '1233',
    'redirectUri': 'sberPayExampleapp://sberidauth',
    'currency': '1233',
    'mobilePhone': undefined,
    'orderNumber': '1233',
    'recurrentExipiry': '1233',
    'recurrentFrequency': 2
  }

  SPayBridgeModule.getPaymentToken(
    requestParams,
    (error: any, paymentToken: string, paymentTokenId: string, tokenExpiration: string) => {
      if(error) {
        Alert.alert(`Error found! ${error}`)
      } else {
        Alert.alert(`Get paymentToken: ${paymentToken}`)
      }
    }
  )
}

function pay() {
  var requestParams = {
    'bankIncoiceId': '1233',
    'paymentToken': '1233aa'
  }

  SPayBridgeModule.pay(
    requestParams,
    (error: any, event: string) => {
      if(error) {
        Alert.alert(`Error found! ${error}`)
      }
        Alert.alert(`Pay with status: ${event}`)
    }
  )
}

function close() {
  SPayBridgeModule.close(
    "success",
    () => {
      Alert.alert(`Closed`)
    }
  )
}

function onPressSPayButton() {
  Alert.alert('Button pressed')
}

const styles = StyleSheet.create({
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
  },
  highlight: {
    fontWeight: '700',
  },
});

export default App;
