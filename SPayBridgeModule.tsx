import {NativeModules} from 'react-native';

class SPayBridgeModule {

    static setupSDK(fn:() => void) {
        NativeModules.SPayBridgeModule.setupSDK( () => fn() )
    }

    static isReadyForSPay(fn: (isReady: boolean) => void) {
        NativeModules.SPayBridgeModule.isReadyForSPay ((event: boolean) => fn(event));
    }
    
    static payWithBankInvoiceId(requestParams: {
                                    merchantLogin: string, 
                                    bankInvoiceId: string,
                                    redirectUri: string
                                }, 
                                fn: (error: any, event: string) => void) {
        NativeModules.SPayBridgeModule.payWithBankInvoiceId(
            requestParams,
            (error: any, event: string) => fn(error, event)
        )
    }

    static getPaymentToken(requestParams: {
                                amount: string, 
                                redirectUri: string,
                                currency: string,
                                mobilePhone?: string,
                                orderNumber: string,
                                recurrentExipiry: string,
                                recurrentFrequency: number
                            }, 
                            fn:(error: any, 
                                paymentToken: string,
                                paymentTokenId: string, 
                                tokenExpiration: string) => void) {
        NativeModules.SPayBridgeModule.payWithBankInvoiceId(
            requestParams,
            (error: any, 
            paymentToken: string,
            paymentTokenId: string, 
            tokenExpiration: string) => fn(error, paymentToken, paymentTokenId, tokenExpiration)
        )
    }

    static pay(requestParams: {
                bankIncoiceId: string,
                paymentToken: string
            }, 
            fn: (error: any, event: string) => void) {
        NativeModules.SPayBridgeModule.pay(
            requestParams,
            (error: any, event: string) => fn(error, event)
        )
    }

    static close(status: string, fn:() => void) {
        NativeModules.SPayBridgeModule.close(
            status,
            () => fn()
        )
    }

}

export default SPayBridgeModule;