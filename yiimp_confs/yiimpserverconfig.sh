#!/usr/bin/env bash

#########################################
# Created by Afiniel for Yiimpool use...#
#########################################

source /etc/functions.sh
source /etc/yiimpool.conf
source $STORAGE_ROOT/yiimp/.yiimp.conf
source $HOME/yiimpool/yiimp_single/.wireguard.install.cnf

if [[ ("$wireguard" == "false") ]]; then

echo '<?php
ini_set('"'"'date.timezone'"'"', '"'"'UTC'"'"');
define('"'"'YAAMP_LOGS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/log"''"'"');
define('"'"'YAAMP_HTDOCS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/web"''"'"');

define('"'"'YAAMP_BIN'"'"', '"'"'/bin'"'"');

define('"'"'YAAMP_DBHOST'"'"', '"'"''"localhost"''"'"');
define('"'"'YAAMP_DBNAME'"'"', '"'"''"${YiiMPDBName}"''"'"');
define('"'"'YAAMP_DBUSER'"'"', '"'"''"${YiiMPPanelName}"''"'"');
define('"'"'YAAMP_DBPASSWORD'"'"', '"'"''"${PanelUserDBPassword}"''"'"');

define('"'"'YAAMP_PRODUCTION'"'"', true);
define('"'"'YAAMP_RENTAL'"'"', false);

define('"'"'YAAMP_LIMIT_ESTIMATE'"'"', false);

define('"'"'YAAMP_FEES_SOLO'"'"', 0.5); // Solo fee in %
define('"'"'YAAMP_FEES_MINING'"'"', 0.5);
define('"'"'YAAMP_FEES_EXCHANGE'"'"', 2);
define('"'"'YAAMP_FEES_RENTING'"'"', 2);
define('"'"'YAAMP_TXFEE_RENTING_WD'"'"', 0.002);

define('"'"'YAAMP_PAYMENTS_FREQ'"'"', 1*60*60);
define('"'"'YAAMP_PAYMENTS_MINI'"'"', 0.001);

define('"'"'YAAMP_ALLOW_EXCHANGE'"'"', false);
define('"'"'YIIMP_PUBLIC_EXPLORER'"'"', false);
define('"'"'YIIMP_PUBLIC_BENCHMARK'"'"', false);

define('"'"'YIIMP_FIAT_ALTERNATIVE'"'"', '"'"'USD'"'"'); // USD is main
define('"'"'YAAMP_USE_NICEHASH_API'"'"', false);

define('"'"'YAAMP_BTCADDRESS'"'"', '"'"'bc1qpnxtg3dvtglrvfllfk3gslt6h5zffkf069nh8r'"'"');

define('"'"'YAAMP_SITE_URL'"'"', '"'"''"${DomainName}"''"'"');
define('"'"'YAAMP_STRATUM_URL'"'"', '"'"''"${StratumURL}"''"'"'); // change if your stratum server is on a different host
define('"'"'YAAMP_SITE_NAME'"'"', '"'"'YiimPool'"'"'); // Change to your website name.
define('"'"'YAAMP_ADMIN_EMAIL'"'"', '"'"''"${SupportEmail}"''"'"');
define('"'"'YAAMP_ADMIN_IP'"'"', '"'"''"${PublicIP}"''"'"'); // samples: "80.236.118.26,90.234.221.11" or "10.0.0.1/8"

define('"'"'YAAMP_ADMIN_WEBCONSOLE'"'"', true);
define('"'"'YAAMP_CREATE_NEW_COINS'"'"', false);
define('"'"'YAAMP_NOTIFY_NEW_COINS'"'"', false);

define('"'"'YAAMP_DEFAULT_ALGO'"'"', '"'"'x11'"'"');

define('"'"'YAAMP_USE_NGINX'"'"', true);

// Exchange public keys (private keys are in a separate config file)
define('"'"'EXCH_CRYPTOPIA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_POLONIEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITTREX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BLEUTRADE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BTER_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_YOBIT_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CCEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_ID'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_USER'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_PIN'"'"', '"'"''"'"');
define('"'"'EXCH_CREX24_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BINANCE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_ID'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_HITBTC_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KRAKEN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KUCOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_LIVECOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_NOVA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_STOCKSEXCHANGE_KEY'"'"', '"'"''"'"');

// Automatic withdraw to Yaamp btc wallet if btc balance > 0.3
define('"'"'EXCH_AUTO_WITHDRAW'"'"', 0.3);

// nicehash keys deposit account & amount to deposit at a time
define('"'"'NICEHASH_API_KEY'"'"','"'"'521c254d-8cc7-4319-83d2-ac6c604b5b49'"'"');
define('"'"'NICEHASH_API_ID'"'"','"'"'9205'"'"');
define('"'"'NICEHASH_DEPOSIT'"'"','"'"'3J9tapPoFCtouAZH7Th8HAPsD8aoykEHzk'"'"');
define('"'"'NICEHASH_DEPOSIT_AMOUNT'"'"','"'"'0.01'"'"');

$cold_wallet_table = array(
'"'"'bc1qpnxtg3dvtglrvfllfk3gslt6h5zffkf069nh8r'"'"' => 0.10,
);

// Sample fixed pool fees
$configFixedPoolFees = array(
'"'"'zr5'"'"' => 2.0,
'"'"'scrypt'"'"' => 20.0,
'"'"'sha256'"'"' => 5.0,
);

// Sample fixed pool fees solo , With 1.5 default set.
$configFixedPoolFeesSolo = array(
'"'"'zr5'"'"' => 1.5,
'"'"'scrypt'"'"' => 1.5,
'"'"'sha256'"'"' => 1.5,
);

// Sample custom stratum ports
$configCustomPorts = array(
// '"'"'x11'"'"' => 7000,
);

// mBTC Coefs per algo (default is 1.0)
$configAlgoNormCoef = array(
// '"'"'x11'"'"' => 5.0,
);' | sudo -E tee $STORAGE_ROOT/yiimp/site/configuration/serverconfig.php >/dev/null 2>&1

else

	echo '<?php
ini_set('"'"'date.timezone'"'"', '"'"'UTC'"'"');
define('"'"'YAAMP_LOGS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/log"''"'"');
define('"'"'YAAMP_HTDOCS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/web"''"'"');

define('"'"'YAAMP_BIN'"'"', '"'"'/bin'"'"');

define('"'"'YAAMP_DBHOST'"'"', '"'"''"${DBInternalIP}"''"'"');
define('"'"'YAAMP_DBNAME'"'"', '"'"''"${YiiMPDBName}"''"'"');
define('"'"'YAAMP_DBUSER'"'"', '"'"''"${YiiMPPanelName}"''"'"');
define('"'"'YAAMP_DBPASSWORD'"'"', '"'"''"${PanelUserDBPassword}"''"'"');

define('"'"'YAAMP_PRODUCTION'"'"', true);
define('"'"'YAAMP_RENTAL'"'"', false); // For rental services

define('"'"'YAAMP_LIMIT_ESTIMATE'"'"', false);

define('"'"'MINING_FEES_SOLO'"'"', 1.0);  // Set Pool Solo Fee
define('"'"'YAAMP_FEES_MINING'"'"', 0.5); // Set Pool Fee (non solo)
define('"'"'YAAMP_FEES_EXCHANGE'"'"', 2); // Set Exchange fee here
define('"'"'YAAMP_FEES_RENTING'"'"', 2); // If rental is enable set rental fee here
define('"'"'YAAMP_TXFEE_RENTING_WD'"'"', 0.002);

define('"'"'YAAMP_PAYMENTS_FREQ'"'"', 1*60*60); // Set how often the pool will do payouts here
define('"'"'YAAMP_PAYMENTS_MINI'"'"', 0.001); // Set minimum payout amount here.

define('"'"'YAAMP_ALLOW_EXCHANGE'"'"', false);
define('"'"'YIIMP_PUBLIC_EXPLORER'"'"', false);
define('"'"'YIIMP_PUBLIC_BENCHMARK'"'"', false);

define('"'"'YIIMP_FIAT_ALTERNATIVE'"'"', '"'"'USD'"'"'); // USD is main
define('"'"'YAAMP_USE_NICEHASH_API'"'"', false);

define('"'"'YAAMP_BTCADDRESS'"'"', '"'"'bc1qpnxtg3dvtglrvfllfk3gslt6h5zffkf069nh8r'"'"');

define('"'"'YAAMP_SITE_URL'"'"', '"'"''"${DomainName}"''"'"');
define('"'"'YAAMP_STRATUM_URL'"'"', '"'"''"${StratumURL}"''"'"'); // change if your stratum server is on a different host
define('"'"'YAAMP_SITE_NAME'"'"', '"'"'afiniel'"'"');
define('"'"'YAAMP_ADMIN_EMAIL'"'"', '"'"''"${SupportEmail}"''"'"');
define('"'"'YAAMP_ADMIN_IP'"'"', '"'"''"${PublicIP}"''"'"'); // samples: "80.236.118.26,90.234.221.11" or "10.0.0.1/8"

define('"'"'YAAMP_ADMIN_WEBCONSOLE'"'"', true);
define('"'"'YAAMP_CREATE_NEW_COINS'"'"', false);
define('"'"'YAAMP_NOTIFY_NEW_COINS'"'"', false);

define('"'"'YAAMP_DEFAULT_ALGO'"'"', '"'"'x11'"'"');

define('"'"'YAAMP_USE_NGINX'"'"', true);

// Exchange public keys (private keys are in a separate config file)
define('"'"'EXCH_CRYPTOPIA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_POLONIEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITTREX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BLEUTRADE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BTER_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_YOBIT_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CCEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_ID'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_USER'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_PIN'"'"', '"'"''"'"');
define('"'"'EXCH_CREX24_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BINANCE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_ID'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_HITBTC_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KRAKEN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KUCOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_LIVECOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_NOVA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_STOCKSEXCHANGE_KEY'"'"', '"'"''"'"');

// Automatic withdraw to Yaamp btc wallet if btc balance > 0.3
define('"'"'EXCH_AUTO_WITHDRAW'"'"', 0.3);

// nicehash keys deposit account & amount to deposit at a time
define('"'"'NICEHASH_API_KEY'"'"','"'"'521c254d-8cc7-4319-83d2-ac6c604b5b49'"'"');
define('"'"'NICEHASH_API_ID'"'"','"'"'9205'"'"');
define('"'"'NICEHASH_DEPOSIT'"'"','"'"'3J9tapPoFCtouAZH7Th8HAPsD8aoykEHzk'"'"');
define('"'"'NICEHASH_DEPOSIT_AMOUNT'"'"','"'"'0.01'"'"');

$cold_wallet_table = array(
'"'"'bc1qpnxtg3dvtglrvfllfk3gslt6h5zffkf069nh8r'"'"' => 0.10,
);

// Sample fixed pool fees
$configFixedPoolFees = array(
'"'"'zr5'"'"' => 2.0,
'"'"'scrypt'"'"' => 20.0,
'"'"'sha256'"'"' => 5.0,
);

// Sample fixed pool fees solo , With 1.5 default set.
$configFixedPoolFeesSolo = array(
'"'"'zr5'"'"' => 1.5,
'"'"'scrypt'"'"' => 1.5,
'"'"'sha256'"'"' => 1.5,
);

// Sample custom stratum ports
$configCustomPorts = array(
// '"'"'x11'"'"' => 7000,
);

// mBTC Coefs per algo (default is 1.0)
$configAlgoNormCoef = array(
// '"'"'x11'"'"' => 5.0,
);' | sudo -E tee $STORAGE_ROOT/yiimp/site/configuration/serverconfig.php >/dev/null 2>&1
fi
cd $HOME/yiimpool/yiimp_single
