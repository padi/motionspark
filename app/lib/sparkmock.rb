class SparkMock

MOCK_RESPONSES = {
  '/my/account' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/accounts/20000426143505724621000000",
          "Name": "Sample User",
          "Id": "20000426173054342350000000",
          "UserType": "Office",
          "UserLevel": "Office",
          "Office": "Sample Office Inc",
          "OfficeId": "20030426173014239760000000",
          "Company": null,
          "CompanyId": null,
          "Mls": "Your Local MLS",
          "MlsId": "20000426143505724628000000",
          "Emails": [
            {
              "Id": "20030426173014239760000000",
              "Type": "Work",
              "Name": "My Work E-mail",
              "Address": "work@test.com",
              "Primary": true
            }, {
              "Id": "20030521173014276180000000",
              "Type": "Mobile",
              "Name": "My Mobile E-mail",
              "Address": "mobile@test.com"
            }
          ],
          "Phones": [
            {
              "Id": "20040426173010918520000000",
              "Type": "Work",
              "Name": "My Work Phone",
              "Number": "701-555-1212",
              "Primary": true
            }, {
              "Id": "20030426173017935470000000",
              "Type": "Mobile",
              "Name": "My Mobile Phone",
              "Number": "702-555-1313"
            }
          ],
          "Websites": [
            {
              "Id": "20080111173011632650000000",
              "Type": "Work",
              "Name": "My Work Website",
              "Uri": "http://iamthebestagent.com",
              "Primary": true
            },
            {
              "Id": "20060412173019920160000000",
              "Type": "Mobile",
              "Name": "My Mobile Website",
              "Uri": "http://m.iamthebestagent.com"
            }
          ],
          "Addresses": [{
              "Id": "20090426173019195810000000",
              "Type": "Work",
              "Name": "My Work Address",
              "Address": "101 Main Ave, Phoenix, AZ 12345",
              "Primary": true
          }],
          "Images": [
            {
              "Id": "20110426173018175220000000",
              "Type": "Photo",
              "Name": "My Photo",
              "Uri": "http://photos.sparkplatform.com/az/...."
            },
            {
              "Id": "20080426173011752890000000",
              "Type": "Logo",
              "Name": "My Logo",
              "Uri": "http://photos.sparkplatform.com/az/...."
            }
          ],
          "Permissions": {
            "Editable": false,
            "EditableSettings": []
          },
          "Settings": {
            "SearchRestrictions": {
              "MlsStatus": ["A","P"],
              "PostalCode": null
            }
          },
          "Qualifications": {
            "Designations": [{
                "Id": "201011120813598729000000",
                "ResourceUri": "/v1/accounts/20080624194124915376000000/qualifications/designations/201011120813598729000000",
                "Code": "ABR",
                "Name": "Accredited Buyer Rep",
                "Dates": "2005-"
            }],
            "Expertise": [{
                "Id": "200911120813598729000000",
                "ResourceUri": "/v1/account/20080624194124915376000000/qualifications/expertise/200911120813598729000000",
                "Name": "Condo specialist",
                "Dates": "2005-"
            }]
          }
        }]
      }
    }',
    put: '{
      "D": {
        "GetEmailUpdates": true
      }
    }'
  },
  '/meta/accounts/profile' => {
    get: '{
      "D": {
        "Success": true,
        "Results": {
          "Emails": [
            {"Name": "Home", "Value":"Home"},
            {"Name": "Office", "Value":"Office"},
            {"Name": "Other E-mail", "Value": "Other E-mail"},
            {"Name": "MLS E-mail", "Value": "MLS E-mail"}
          ],
          "Phones": [
            {"Name": "Home", "Value": "Home"},
            {"Name": "Office", "Value": "Office"},
            {"Name": "Fax", "Value": "Fax"},
            {"Name": "Mobile", "Value": "Mobile"},
            {"Name": "Pager", "Value": "Pager"},
            {"Name": "Other Phone", "Value": "Other Phone"},
            {"Name": "Voice", "Value": "Voice"},
            {"Name": "Direct", "Value": "Direct"},
            {"Name": "Toll-Free", "Value": "Toll-Free"},
            {"Name": "2nd Home", "Value": "2nd Home"},
            {"Name": "Primary", "Value": "Primary"},
            {"Name": "2nd Fax", "Value": "2nd Fax"},
            {"Name": "Modem", "Value": "Modem"},
            {"Name": "Office Fax", "Value": "Office Fax"},
            {"Name": "2nd Mobile", "Value": "2nd Mobile"},
            {"Name": "2nd Pager", "Value": "2nd Pager"}
          ],
          "Websites": [
            {"Name": "Home", "Value":"Home"},
            {"Name": "Office", "Value":"Office"},
            {"Name": "Other URL", "Value": "Other URL"}
          ],
          "Images": [
            {"Name": "Logo", "Value":"Logo"},
            {"Name": "Photo", "Value":"Photo"},
            {"Name": "Other Image", "Value": "Other Image"},
            {"Name": "Forms Logo", "Value":"Forms Logo"}
          ],
          "Addresses": [
            {"Name": "Home", "Value":"Home"},
            {"Name": "Office", "Value":"Office"},
            {"Name": "Other Address", "Value": "Other Address"},
            {"Name": "Mailing Address", "Value":"Mailing Address"}
          ]
        }
      }
    }'
  },
  '/accounts/1/qualifications' => {
  get: '{
    "D": {
      "Success": true,
      "Results": [{
        "Qualifications": {
          "Designations": [{
            "Id": "201011120813598729000000",
            "ResourceUri": "/v1/accounts/20080624194124915376000000/qualifications/designations/201011120813598729000000",
            "Code": "ABR",
            "Name": "Accredited Buyer Rep",
            "Dates": "2005-"
          }],
          "Expertise": [{
            "Id": "200911120813598729000000",
            "ResourceUri": "/v1/account/20080624194124915376000000/qualifications/expertise/200911120813598729000000",
            "Name": "Condo specialist",
            "Dates": "2005-"
          }]
        }
      }]
    }
  }'
  },
  '/accounts/1/qualifications/designations' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "Designations": [{
            "Id": "201011120813598729000000",
            "ResourceUri": "/v1/accounts/20080624194124915376000000/qualifications/designations/201011120813598729000000",
            "Code": "ABR",
            "Name": "Accredited Buyer Rep",
            "Dates": "2005-"
          }]
        }]
      }
    }'
  },
  '/accounts/1/qualifications/designations/1' => {
    get: ' {
      "D": {
        "Success": true,
        "Results": [{
          "Id": "201011120813598729000000",
          "ResourceUri": "/v1/accounts/20080624194124915376000000/qualifications/designations/201011120813598729000000",
          "Code": "ABR",
          "Name": "Accredited Buyer Rep",
          "Dates": "2005-"
        }]
      }
    }'
  },
  '/contacts' => {
    get: '{
      "D": {
        "Results": [{
          "ResourceUri": "/v1/contacts/20120612211157015776000000",
          "DisplayName": "Another test",
          "Id": "20120612211157015776000000",
          "FamilyName": "Test",
          "PrimaryEmail": "another@test.com",
          "ModificationTimestamp": "2012-06-12T16:11:57-05:00",
          "GivenName": "Another"
        }, {
          "HomeStreetAddress": "123 S. Main St",
          "ResourceUri": "/v1/contacts/20120614194913668760000000",
          "PrimaryPhoneNumber": "888-123-4567",
          "HomePostalCode": "58104",
          "HomeLocality": "Fargo",
          "DisplayName": "Example Contact",
          "Tags": ["Example Group"],
          "Id": "20120614194913668760000000",
          "PrimaryEmail": "apiexample@sparkplatform.com",
          "HomeRegion": "ND",
          "ModificationTimestamp": "2012-06-14T14:49:13-05:00"
        }, {
          "ResourceUri": "/v1/contacts/20110629170919336600000000",
          "DisplayName": "OAuth Test Client",
          "Id": "20110629170919336600000000",
          "PrimaryEmail": "test@test.com",
          "ModificationTimestamp": "2012-06-12T16:11:12-05:00"
        }, {
          "ResourceUri": "/v1/contacts/20110408233746036088000000",
          "DisplayName": "test contact",
          "Tags": ["test_group"],
          "Id": "20110408233746036088000000",
          "FamilyName": "contact",
          "PrimaryEmail": "testcontact@test.test",
          "ModificationTimestamp": "2011-04-08T18:38:03-05:00",
          "GivenName": "test"
        }],
        "Success": true
      }
    }'
  },
  '/contacts/1' => {
    get: '{
      "D": {
        "Results": [{
          "HomeStreetAddress": "123 S. Main St",
          "ResourceUri": "/v1/contacts/20120614194913668760000000",
          "PrimaryPhoneNumber": "888-123-4567",
          "HomePostalCode": "58104",
          "HomeLocality": "Fargo",
          "DisplayName": "Example Contact",
          "Tags": ["Example Group"],
          "Id": "20120614194913668760000000",
          "PrimaryEmail": "apiexample@sparkplatform.com",
          "HomeRegion": "ND",
          "ModificationTimestamp": "2012-06-14T14:49:13-05:00"
        }],
        "Success": true
      }
    }'
  },
  '/contacts/export/all' => {
    get: '{
      "D": {
        "Success": true,
        "ExportTimestamp": 2012-02-17T13:47:23
        "Results": [
          {
            "ResourceUri": "/vX/contacts/201010122342756895000000",
            "Id": "201010122342756895000000",
            "OwnerId": "201010943697015434000000",
            "DisplayName": "Some Person",
            "PrimaryEmail": "test@test.com",
            "Tags": ["IDX Lead"]
          }, {
            "ResourceUri": "/vX/contacts/201010122342756234000000",
            "Id": "201010122342756234000000",
            "OwnerId": "201010123059764234000000",
            "DisplayName": "Another Person",
            "PrimaryEmail": "tester@testing.com",
            "Tags": ["Recent Buyers"]
          },

        ]
      }
    }'
  },
  '/contacts/export' => {
    get: '{
      "D": {
        "Success": true,
        "ExportTimestamp": 2012-02-17T13:47:23
        "Results": [
          {
            "ResourceUri": "/vX/contacts/201010122342756895000000",
            "Id": "201010122342756895000000",
            "DisplayName": "Some Person",
            "PrimaryEmail": "test@test.com",
            "Tags": ["IDX Lead"]
          },
          {
            "ResourceUri": "/vX/contacts/201010122342756234000000",
            "Id": "201010122342756234000000",
            "DisplayName": "Another Person",
            "PrimaryEmail": "tester@testing.com",
            "Tags": ["Recent Buyers"]
          },
        ]
      }
    }'
  },
  '/customfields' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "General Property Description": {
            "Fields": {
              "Directions": {
                "ResourceUri": "/v1/customfields/Directions",
                "HasList": false,
                "Label": "Directions",
                "MaxListSize": 0,
                "Searchable": true,
                "Type": "Character",
                "MlsVisible": ["A", "G", "M"]
              },
              "Flood Plain": {
                "ResourceUri": "/v1/customfields/Flood Plain",
                "HasList": true,
                "Label": "Flood Plain",
                "MaxListSize": false,
                "Searchable": true,
                "Type": "Character",
                "MlsVisible": ["A", "G", "I", "J", "M"]
              },
              "Taxes": {
                "ResourceUri": "/v1/customfields/Taxes",
                "HasList": false,
                "Label": "Taxes",
                "MaxListSize": 0,
                "Searchable": true,
                "Type": "Decimal",
                "MlsVisible": ["B", "C", "E"]
              }
            },
            "Label": "General Property Description"
          }
        }]
      }
    }'
  },
  '/customfields/Taxes' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "Taxes": {
            "ResourceUri": "/v1/customfields/Taxes",
            "HasList": false,
            "Label": "Taxes",
            "MaxListSize": 0,
            "Searchable": true,
            "Type": "Decimal",
            "MlsVisible": ["B", "C", "E"]
          }
        }]
      }
    }'
  },
  '/idxlinks' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "ResourceUri": "/idxlinks/20101115061222486591000000",
            "Id": "20101115061222486591000000",
            "Name": "Residential Search",
            "Uri": "http://link.flexmls.com/riptgq7ohvr,12",
            "LinkId": "riptgq7ohvr",
            "LinkType": "QuickSearch"
          },
          {
            "ResourceUri": "/idxlinks/20101116011322386631000000",
            "Id": "20101116011322386631000000",
            "Name": "Commercial Search",
            "Uri": "http://link.flexmls.com/Xiptgq7ohvr,12",
            "LinkId": "Xiptgq7ohvr",
            "LinkType": "QuickSearch"
          }
        ]
      }
    }'
  },
  '/idxlinks/1' => {
    get: '{
      "D": {
          "Success": true,
          "Results": [{
            "ResourceUri": "/idxlinks/20101116011322386631000000",
            "Id": "20101116011322386631000000",
            "Name": "Commercial For Sale",
            "Uri": "http://link.flexmls.com/Xiptgq7ohvr,12",
            "LinkId": "Xiptgq7ohvr",
            "LinkType": "SavedSearch",
            "SearchId": "20091219144256948576000000"
          }]
      }
    }'
  },
  '/listingcarts' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "ResourceUri": "/vX/listingcarts/20100912153422758914000000",
            "Id": "20100912153422758914000000",
            "Name": "My Listing Cart",
            "ListingCount": 10
          },
          {
            "ResourceUri": "/vX/listingcarts/20110112133422752751000000",
            "Id": "20110112133422752751000000",
            "Name": "My Other Listing Cart",
            "ListingCount": 15
          }
        ]
      }
    }'
  },
  '/listingcarts/1' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "ResourceUri": "/vX/listingcarts/20100912153422758914000000",
            "Id": "20100912153422758914000000",
            "Name": "My Listing Cart",
            "ListingIds": [
              "20110112234857732941000000",
              "20110302120238448431000000",
              "20110510011212354751000000"
            ]
          },
          {
            "ResourceUri": "/vX/listingcarts/20110112133422752751000000",
            "Id": "20110112133422752751000000",
            "Name": "My Other Listing Cart",
            "ListingIds": [
            "20110112234854732941000000",
            "20110302120128448431000000",
            "20110410011212354751000000"
            ]
          }
        ]
      }
    }'
  },
  '/listings' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "ResourceUri": "/vX/listings/20060412165917817933000000",
            "Id": "20060412165917817933000000",
            "StandardFields": {
              "ListingKey": "20060412165917817933000000",
              "ListingId": "10-1796",
              "PropertyType": "A ",
              "PropertySubType": "SF",
              "ListPrice": 1009999,
              "StreetNumber": "334",
              "StreetDirPrefix": null,
              "StreetName": "8th",
              "StreetSuffix": "St",
              "StreetDirSuffix": "S",
              "StreetAdditionalInfo": null,
              "City": "Fargo",
              "StateOrProvince": "ND",
              "PostalCode": "58103",
              "YearBuilt": 1884,
              "BuildingAreaTotal": 7275,
              "BathsThreeQuarter": 1,
              "BathsTotal": 8,
              "BathsFull": 5,
              "BedsTotal": 8,
              "BathsHalf": 2,
              "Longitude": -96.792246,
              "Latitude": 46.868464,
              "SubdivisionName": "Westgate",
              "MLSAreaMinor": "West",
              "CountyOrParish": null,
              "PublicRemarks": "Great foyer. Cool kitchen. 6 fireplaces. The list goes on.",
              "PrivateRemarks": "********",
              "PrivateOfficeRemarks": "********",
              "PendingDate": "********",
              "CloseDate": "********",
              "CancelDate": "********",
              "WithdrawDate": "********",
              "ListAgentFirstName": "Joe",
              "ListAgentMiddleName": "",
              "ListAgentLastName": "Agent",
              "ListAgentPreferredPhone": "123-456-7890",
              "ListAgentPreferredPhoneExt": "3",
              "ListAgentOfficePhone": "123-456-7890",
              "ListAgentOfficePhoneExt": "123-456-7890",
              "ListAgentCellPhone": "123-456-7890",
              "ListAgentDirectPhone": "123-456-7890",
              "ListAgentTollFreePhone": "123-456-7890",
              "ListAgentFax": "123-456-7890",
              "ListAgentPager": "123-456-7890",
              "ListAgentVoiceMail": "123-456-7890",
              "ListAgentVoiceMailExt": "123-456-7890",
              "ListAgentEmail": "joe@joeagent.com",
              "ListAgentURL": "http://joeagent.com/",
              "ListAgentStateLicense": "12345",
              "ListAgentDesignation": "CRS, GRI",
              "ListOfficeName": "BigBrokerCo",
              "ListOfficePhone": "987-654-3210",
              "ListOfficePhoneExt": "33",
              "ListOfficeFax": "987-654-3210",
              "ListOfficeEmail": "big@brokerco.com",
              "ListOfficeURL": "http://bigbrokerco.com",
              "CoListAgentFirstName": "Jimmy",
              "CoListAgentMiddleName": "",
              "CoListAgentLastName": "Agent",
              "CoListAgentPreferredPhone": "323-456-7890",
              "CoListAgentPreferredPhoneExt": "3",
              "CoListAgentOfficePhone": "123-456-7890",
              "CoListAgentOfficePhoneExt": "123-456-7890",
              "CoListAgentCellPhone": "123-456-7890",
              "CoListAgentDirectPhone": "123-456-7890",
              "CoListAgentTollFreePhone": "123-456-7890",
              "CoListAgentFax": "123-456-7890",
              "CoListAgentPager": "123-456-7890",
              "CoListAgentVoiceMail": "123-456-7890",
              "CoListAgentVoiceMailExt": "123-456-7890",
              "CoListAgentEmail": "jimmy@jimmyagent.com",
              "CoListAgentURL": "http://jimmyagent.com/",
              "CoListAgentStateLicense": "22345",
              "CoListAgentDesignation": "CRS, GRI",
              "CoListOfficeName": "BigBrokerCo",
              "CoListOfficePhone": "987-654-3210",
              "CoListOfficePhoneExt": "33",
              "CoListOfficeFax": "987-654-3210",
              "CoListOfficeEmail": "big@brokerco.com",
              "CoListOfficeURL": "http://bigbrokerco.com",
              "ModificationTimestamp": "2010-11-22T20:09:37Z",
              "VirtualTourURLBranded": "http://somethirdpartyservice.com/234",
              "VirtualTourURLUnbranded": "http://somethirdpartyservice.com/345",
              "Supplement": "Text supplement goes here"
            }
          },
          {
            "ResourceUri": "/vX/listings/20060412165917817933000001",
            "Id": "20060412165917817933000001",
            "StandardFields": {
              "ListingKey": "20060412165917817933000001",
              "ListingId": "10-1797",
              "PropertyType": "A ",
              "PropertySubType": "SF",
              "ListPrice": 1099978,
              "StreetNumber": "212",
              "StreetDirPrefix": null,
              "StreetName": "8th",
              "StreetSuffix": "St",
              "StreetDirSuffix": "S",
              "StreetAdditionalInfo": null,
              "City": "Fargo",
              "StateOrProvince": "ND",
              "PostalCode": "58103",
              "YearBuilt": 1884,
              "BuildingAreaTotal": 7275,
              "BathsThreeQuarter": 1,
              "BathsTotal": 8,
              "BathsFull": 5,
              "BedsTotal": 8,
              "BathsHalf": 2,
              "Longitude": -96.792246,
              "Latitude": 46.868464,
              "SubdivisionName": "Westgate",
              "MLSAreaMinor": "West",
              "CountyOrParish": null,
              "PublicRemarks": "Relaxing place by the sea.",
              "PrivateRemarks": "********",
              "PrivateOfficeRemarks": "********",
              "PendingDate": "********",
              "CloseDate": "********",
              "CancelDate": "********",
              "WithdrawDate": "********",
              "ListAgentFirstName": "Johnny",
              "ListAgentMiddleName": "",
              "ListAgentLastName": "Bravo",
              "ListAgentPreferredPhone": "123-456-7890",
              "ListAgentPreferredPhoneExt": "3",
              "ListAgentOfficePhone": "123-456-7890",
              "ListAgentOfficePhoneExt": "123-456-7890",
              "ListAgentCellPhone": "123-456-7890",
              "ListAgentDirectPhone": "123-456-7890",
              "ListAgentTollFreePhone": "123-456-7890",
              "ListAgentFax": "123-456-7890",
              "ListAgentPager": "123-456-7890",
              "ListAgentVoiceMail": "123-456-7890",
              "ListAgentVoiceMailExt": "123-456-7890",
              "ListAgentEmail": "johnny@bravo.com",
              "ListAgentURL": "http://johnnybravo.com/",
              "ListAgentStateLicense": "12345",
              "ListAgentDesignation": "CRS, GRI",
              "ListOfficeName": "BigBrokerCo",
              "ListOfficePhone": "987-654-3210",
              "ListOfficePhoneExt": "33",
              "ListOfficeFax": "987-654-3210",
              "ListOfficeEmail": "big@brokerco.com",
              "ListOfficeURL": "http://bigbrokerco.com",
              "CoListAgentFirstName": "Jimmy",
              "CoListAgentMiddleName": "",
              "CoListAgentLastName": "Agent",
              "CoListAgentPreferredPhone": "323-456-7890",
              "CoListAgentPreferredPhoneExt": "3",
              "CoListAgentOfficePhone": "123-456-7890",
              "CoListAgentOfficePhoneExt": "123-456-7890",
              "CoListAgentCellPhone": "123-456-7890",
              "CoListAgentDirectPhone": "123-456-7890",
              "CoListAgentTollFreePhone": "123-456-7890",
              "CoListAgentFax": "123-456-7890",
              "CoListAgentPager": "123-456-7890",
              "CoListAgentVoiceMail": "123-456-7890",
              "CoListAgentVoiceMailExt": "123-456-7890",
              "CoListAgentEmail": "jimmy@jimmyagent.com",
              "CoListAgentURL": "http://jimmyagent.com/",
              "CoListAgentStateLicense": "22345",
              "CoListAgentDesignation": "CRS, GRI",
              "CoListOfficeName": "BigBrokerCo",
              "CoListOfficePhone": "987-654-3210",
              "CoListOfficePhoneExt": "33",
              "CoListOfficeFax": "987-654-3210",
              "CoListOfficeEmail": "big@brokerco.com",
              "CoListOfficeURL": "http://bigbrokerco.com",
              "ModificationTimestamp": "2010-11-22T20:09:37Z",
              "VirtualTourURLBranded": "http://somethirdpartyservice.com/234",
              "VirtualTourURLUnbranded": "http://somethirdpartyservice.com/345",
              "Supplement": "Text supplement goes here"
            }
          },
          {
            "ResourceUri": "/vX/listings/20060412165917817933000002",
            "Id": "20060412165917817933000002",
            "StandardFields": {
              "ListingKey": "20060412165917817933000002",
              "ListingId": "10-1798",
              "PropertyType": "A ",
              "PropertySubType": "SF",
              "ListPrice": 2472334,
              "StreetNumber": "111",
              "StreetDirPrefix": null,
              "StreetName": "8th",
              "StreetSuffix": "St",
              "StreetDirSuffix": "S",
              "StreetAdditionalInfo": null,
              "City": "Fargo",
              "StateOrProvince": "ND",
              "PostalCode": "58103",
              "YearBuilt": 1884,
              "BuildingAreaTotal": 7275,
              "BathsThreeQuarter": 1,
              "BathsTotal": 8,
              "BathsFull": 5,
              "BedsTotal": 8,
              "BathsHalf": 2,
              "Longitude": -96.792246,
              "Latitude": 46.868464,
              "SubdivisionName": "Westgate",
              "MLSAreaMinor": "West",
              "CountyOrParish": null,
              "PublicRemarks": "5 Bedrooms. Great fireplace. Wide pool",
              "PrivateRemarks": "********",
              "PrivateOfficeRemarks": "********",
              "PendingDate": "********",
              "CloseDate": "********",
              "CancelDate": "********",
              "WithdrawDate": "********",
              "ListAgentFirstName": "Janina",
              "ListAgentMiddleName": "",
              "ListAgentLastName": "Ramos",
              "ListAgentPreferredPhone": "123-456-7890",
              "ListAgentPreferredPhoneExt": "3",
              "ListAgentOfficePhone": "123-456-7890",
              "ListAgentOfficePhoneExt": "123-456-7890",
              "ListAgentCellPhone": "123-456-7890",
              "ListAgentDirectPhone": "123-456-7890",
              "ListAgentTollFreePhone": "123-456-7890",
              "ListAgentFax": "123-456-7890",
              "ListAgentPager": "123-456-7890",
              "ListAgentVoiceMail": "123-456-7890",
              "ListAgentVoiceMailExt": "123-456-7890",
              "ListAgentEmail": "janina@ramos.com",
              "ListAgentURL": "http://janinaramos.com/",
              "ListAgentStateLicense": "12345",
              "ListAgentDesignation": "CRS, GRI",
              "ListOfficeName": "BigBrokerCo",
              "ListOfficePhone": "987-654-3210",
              "ListOfficePhoneExt": "33",
              "ListOfficeFax": "987-654-3210",
              "ListOfficeEmail": "big@brokerco.com",
              "ListOfficeURL": "http://bigbrokerco.com",
              "CoListAgentFirstName": "Jimmy",
              "CoListAgentMiddleName": "",
              "CoListAgentLastName": "Agent",
              "CoListAgentPreferredPhone": "323-456-7890",
              "CoListAgentPreferredPhoneExt": "3",
              "CoListAgentOfficePhone": "123-456-7890",
              "CoListAgentOfficePhoneExt": "123-456-7890",
              "CoListAgentCellPhone": "123-456-7890",
              "CoListAgentDirectPhone": "123-456-7890",
              "CoListAgentTollFreePhone": "123-456-7890",
              "CoListAgentFax": "123-456-7890",
              "CoListAgentPager": "123-456-7890",
              "CoListAgentVoiceMail": "123-456-7890",
              "CoListAgentVoiceMailExt": "123-456-7890",
              "CoListAgentEmail": "jimmy@jimmyagent.com",
              "CoListAgentURL": "http://jimmyagent.com/",
              "CoListAgentStateLicense": "22345",
              "CoListAgentDesignation": "CRS, GRI",
              "CoListOfficeName": "BigBrokerCo",
              "CoListOfficePhone": "987-654-3210",
              "CoListOfficePhoneExt": "33",
              "CoListOfficeFax": "987-654-3210",
              "CoListOfficeEmail": "big@brokerco.com",
              "CoListOfficeURL": "http://bigbrokerco.com",
              "ModificationTimestamp": "2010-11-22T20:09:37Z",
              "VirtualTourURLBranded": "http://somethirdpartyservice.com/234",
              "VirtualTourURLUnbranded": "http://somethirdpartyservice.com/345",
              "Supplement": "Text supplement goes here"
            }
          }
        ]
      }
    }'
  },
  '/listings/1' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "ResourceUri": "/vX/listings/20060412165917817933000000",
            "Id": "20060412165917817933000000",
            "StandardFields": {
              "ListingKey": "20060412165917817933000000",
              "ListingId": "10-1796",
              "PropertyType": "A ",
              "PropertySubType": "SF",
              "ListPrice": 1079900,
              "StreetNumber": "611",
              "StreetDirPrefix": null,
              "StreetName": "8th",
              "StreetSuffix": "St",
              "StreetDirSuffix": "S",
              "StreetAdditionalInfo": null,
              "City": "Fargo",
              "StateOrProvince": "ND",
              "PostalCode": "58103",
              "YearBuilt": 1884,
              "BuildingAreaTotal": 7275,
              "BathsThreeQuarter": 1,
              "BathsTotal": 8,
              "BathsFull": 5,
              "BedsTotal": 8,
              "BathsHalf": 2,
              "Longitude": -96.792246,
              "Latitude": 46.868464,
              "SubdivisionName": "Westgate",
              "MLSAreaMinor": "West",
              "CountyOrParish": null,
              "PublicRemarks": "Great foyer. Cool kitchen. 6 fireplaces. The list goes on.",
              "PrivateRemarks": "********",
              "PrivateOfficeRemarks": "********",
              "PendingDate", "********",
              "CloseDate": "********",
              "CancelDate": "********",
              "WithdrawDate": "********",
              "ListAgentFirstName": "Joe",
              "ListAgentMiddleName": "",
              "ListAgentLastName": "Agent",
              "ListAgentPreferredPhone": "123-456-7890",
              "ListAgentPreferredPhoneExt": "3",
              "ListAgentOfficePhone": "123-456-7890",
              "ListAgentOfficePhoneExt": "123-456-7890",
              "ListAgentCellPhone": "123-456-7890",
              "ListAgentDirectPhone": "123-456-7890",
              "ListAgentTollFreePhone": "123-456-7890",
              "ListAgentFax": "123-456-7890",
              "ListAgentPager": "123-456-7890",
              "ListAgentVoiceMail": "123-456-7890",
              "ListAgentVoiceMailExt": "123-456-7890",
              "ListAgentEmail": "joe@joeagent.com",
              "ListAgentURL": "http://joeagent.com/",
              "ListAgentStateLicense": "12345",
              "ListAgentDesignation": "CRS, GRI",
              "ListOfficeName": "BigBrokerCo",
              "ListOfficePhone": "987-654-3210",
              "ListOfficePhoneExt": "33",
              "ListOfficeFax": "987-654-3210",
              "ListOfficeEmail": "big@brokerco.com",
              "ListOfficeURL": "http://bigbrokerco.com",
              "CoListAgentFirstName": "Jimmy",
              "CoListAgentMiddleName": "",
              "CoListAgentLastName": "Agent",
              "CoListAgentPreferredPhone": "323-456-7890",
              "CoListAgentPreferredPhoneExt": "3",
              "CoListAgentOfficePhone": "123-456-7890",
              "CoListAgentOfficePhoneExt": "123-456-7890",
              "CoListAgentCellPhone": "123-456-7890",
              "CoListAgentDirectPhone": "123-456-7890",
              "CoListAgentTollFreePhone": "123-456-7890",
              "CoListAgentFax": "123-456-7890",
              "CoListAgentPager": "123-456-7890",
              "CoListAgentVoiceMail": "123-456-7890",
              "CoListAgentVoiceMailExt": "123-456-7890",
              "CoListAgentEmail": "jimmy@jimmyagent.com",
              "CoListAgentURL": "http://jimmyagent.com/",
              "CoListAgentStateLicense": "22345",
              "CoListAgentDesignation": "CRS, GRI",
              "CoListOfficeName": "BigBrokerCo",
              "CoListOfficePhone": "987-654-3210",
              "CoListOfficePhoneExt": "33",
              "CoListOfficeFax": "987-654-3210",
              "CoListOfficeEmail": "big@brokerco.com",
              "CoListOfficeURL": "http://bigbrokerco.com",
              "ModificationTimestamp": "2010-11-22T20:09:37Z",
              "VirtualTourURLBranded": "http://somethirdpartyservice.com/234",
              "VirtualTourURLUnbranded": "http://somethirdpartyservice.com/345",
              "Supplement": "Text supplement goes here",
              "Photos": [{
                "ResourceUri": "/vX/listings/20060412165917817933000000/photos/20080917142739989238000000",
                "Id": "20080917142739989238000000",
                "Name": "Listing Photo",
                "Caption": "",
                "UriThumb": "http://photos.sparkplatform.com/demomls/20080917142739989238000000-t.jpg",
                "Uri300": "http://photos.sparkplatform.com/demomls/20080917142739989238000000.jpg",
                "Uri640": "http://resize.sparkplatform.com/demomls/640x480/true/20080917142739989238000000-o.jpg",
                "Uri800": "http://resize.sparkplatform.com/demomls/800x600/true/20080917142739989238000000-o.jpg",
                "Uri1024": "http://resize.sparkplatform.com/demomls/1024x768/true/20080917142739989238000000-o.jpg",
                "Uri1280": "http://resize.sparkplatform.com/demomls/1280x1024/true/20080917142739989238000000-o.jpg",
                "UriLarge": "http://photos.sparkplatform.com/demomls/20080917142739989238000000-o.jpg",
                "Primary": true
              }],
              "OpenHouses": [{
                "ResourceUri": "/vX/listings/20060412165917817933000000/openhouses/10000000000000000000000000",
                "Id": "10000000000000000000000000",
                "Date": "2007-07-08",
                "StartTime": "9:00 am",
                "EndTime": "1:00 pm"
              }],
              "Documents": [{
                "ResourceUri": "/listings/20100815153524571646000000/documents/20101125153422574618000000",
                "Id": "20101125153422574618000000",
                "Name": "Document name",
                "Uri": "http://documents.sparkplatform.com/abc.pdf"
              }],
              "VirtualTours": [{
                "ResourceUri": "/listings/20100815153524571646000000/virtualtours/20101213041526458274000000",
                "Id": "20101213041526458274000000",
                "Name": "VT name",
                "Uri": "http://somethirdpartyvtservice.com/123",
                "Type": "branded"
              }],
              "Videos": [{
                "ResourceUri": "/listings/20100815153524571646000000/videos/20101213041526458274000000",
                "Id": "20101213041526458274000000",
                "Name": "Video name",
                "Caption": "Caption text",
                "Type": "branded",
                "ObjectHtml": "<>"
              }],
              "CustomFields": [{
                "Main": [
                  {
                    "Contract Information": [
                      { "Book Section": "Residential w/ Acreage" },
                      { "Area": "North (Bonner & Boundary)" },
                      { "Begin Date": "2006-03-03" }
                    ]
                  },{
                    "General Property Description": [
                      { "Realtor.COM Type": "Residential - Single Family" },
                      { "Style": "Multi Level" },
                      { "Basement": "No" },
                      { "Stories": 2 },
                      { "Garage Type": "Att Garage" },
                      { "Garage Stall": "3 or more" },
                      { "SqFt B": 0 },
                      { "SqFt 1": 3585 },
                      { "SqFt 2": 1500 },
                      { "SqFt Source": "Assessor/Tax Roll" },
                      { "New Construction": "No" },
                      { "Lot Acres": 36.9 },
                      { "Lot Type 1": "Residential" },
                      { "Lot Type 2": "Lake/River View" },
                      { "Lake/River Name": "Granite Lake" }
                    ]
                  }
                ],
                "Details": [
                  {
                    "View": [
                      { "Mountain": true },
                      { "River": true }
                    ]
                  },
                  {
                    "Lot Features": [
                      { "Irregular": true },
                      { "Level": true }
                    ]
                  }
                ],
                "Rooms": [
                  {
                    "Id": "20110525151622697369000000",
                    "ResourceUri": "/v1/listings/20101014195350951959000000/rooms/20110525151622697369000000",
                    "Fields": [
                      { "Room Name": "Bedroom" },
                      { "Room Level": "1" },
                      { "No. of Rooms": "2" },
                      { "Area": "40" },
                      { "Length": null },
                      { "Width": null },
                      { "Room Remarks": "Lorem ipsum dolor sit amet" }
                    ]
                  }
                ]
              }]
            }
            "DisplayCompliance":{
              "IDXLogoSmall":{
                "LogoUri":"http://somesite.com/logo/small.jpg",
                "Type":"Uri"
              },
              "View":"Detail",
              "IDXLogo":{
                "LogoUri":"Acme Realty",
                "Type":"Text"
              }
            }
          }
        ],
        "Pagination": {
          "TotalRows": 78,
          "PageSize": 25,
          "TotalPages": 4,
          "CurrentPage": 1
        }
      }
    }'
  },
  '/my/listings' => {
    get: '{
      "D": {
        "Success": true,
        "Pagination": {
          "TotalRows": 0,
          "PageSize": 2,
          "CurrentPage": 1,
          "TotalPages": 1
        },
        "Results": []
      }
    }'
  },
  '/office/listings' => {
    get: '{
      "D": {
        "Pagination": {
          "TotalRows": 0,
          "PageSize": 2,
          "CurrentPage": 1,
          "TotalPages": 1
        },
        "Success": true,
        "Results": []
      }
    }'
  },
  '/listings/documents' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/listings/20100815153524571646000000/documents/20101125153422574618000000",
          "Id": "20101125153422574618000000",
          "Name": "Document name",
          "Uri": "http://documents.sparkplatform.com/abc.pdf"
        }]
      }
    }'
  },
  '/listings/1/shared/notes' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/listings/20100815153524571646000000/shared/notes/contacts/20100912536192756362000000/",
          "Note": "Great home, wondering if seller is willing to include hot tub."
        }]
      }
    }'
  },
  '/listings/1/openhouses' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "ResourceUri": "/vX/listings/20060412165917817933000000/openhouses/20101127153422574618000000",
            "Id": "20101127153422574618000000",
            "Date": "10/01/2010",
            "StartTime": "09:00 AM",
            "EndTime": "12:00 PM",
            "Comments": "Free chips!"
          },
          {
            "ResourceUri": "/vX/listings/20060412165917817933000000/openhouses/20101127153422174618000000",
            "Id": "20101127153422174618000000",
            "Date": "10/08/2010",
            "StartTime": "09:00 AM",
            "EndTime": "12:00 PM",
            "Comments": null
          }
        ]
      }
    }'
  },
  '/listings/1/photos' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/listings/20060412165917817933000000/photos/20080917142739989238000000",
          "Id": "20080917142739989238000000",
          "Name": "Listing Photo",
          "Caption": "",
          "UriThumb": "http://photos.sparkplatform.com/demomls/20080917142739989238000000-t.jpg",
          "Uri300": "http://photos.sparkplatform.com/demomls/20080917142739989238000000.jpg",
          "Uri640": "http://resize.sparkplatform.com/demomls/640x480/true/20080917142739989238000000-o.jpg",
          "Uri800": "http://resize.sparkplatform.com/demomls/800x600/true/20080917142739989238000000-o.jpg",
          "Uri1024": "http://resize.sparkplatform.com/demomls/1024x768/true/20080917142739989238000000-o.jpg",
          "Uri1280": "http://resize.sparkplatform.com/demomls/1280x1024/true/20080917142739989238000000-o.jpg",
          "UriLarge": "http://photos.sparkplatform.com/demomls/20080917142739989238000000-o.jpg",
          "Primary": true
        }]
      }
    }'
  },
  '/listings/1/rentalcalendar' => {
    get: '{
      "D": {
        "Results": [{
          "Id":   "20110003930012897000000000",
          "Type": "Rented",
          "StartDate": "2011-03-14",
          "EndDate": "2011-03-15"
        }],
        "Success": true
      }
    }'
  },
  '/listings/1/tourofhomes' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "AdditionalInfo": [
              {"Hosted By": "Mr. Agent"},
              {"Hosted Phone": "111-222-3333"},
              {"Area": "North Fargo"}
            ],
            "Comments": "First listing tour",
            "Date": "05/14/2012",
            "Id": "20120509194700383011000000",
            "ResourceUri": "/vX/listings/20000612234839640464000000/tourofhomes/20120509194700383011000000",
            "StartTime": "12:00 PM",
            "EndTime": "5:00 PM"
          }
        ]
      }
    }'
  },
  '/listings/1/tickets' => {
    post: '{
      "D": {
        "Success": true,
        "Results": [{
          "Token": "ae788854e77d2f6c87d79c47b90c54ea",
          "ExpiresIn": 3600,
          "Service": "PhotoUploads"
          "Uri": "https:\/\/sparkplatform.com\/uploads\/photos"
        }]
      }
    }'
  },
  '/listings/1/videos' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/listings/20100815153524571646000000/videos/20101213041526458274000000",
          "Id": "20101213041526458274000000",
          "Name": "Video name",
          "Caption": "Caption text",
          "Type": "branded",
          "ObjectHtml": "<>"
        }]
      }
    }'
  },
  '/listings/1/virtualtours' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/listings/20100815153524571646000000/virtualtours/20101213041526458274000000",
          "Id": "20101213041526458274000000",
          "Name": "VT name",
          "Uri": "http://somethirdpartyvtservice.com/123",
          "Type": "branded"
        }]
      }
    }'
  },
  '/marketstatistics/absorpotion' => {
    get: '{
      "Dates": ["11/1/2010","10/1/2010","9/1/2010","8/1/2010","7/1/2010", "6/1/2010","5/1/2010","4/1/2010","3/1/2010","2/1/2010", "1/1/2010","12/1/2009"],
      "AbsorptionRate": [6.11,5.14,4.51,5.15,5.33,6.01,4.92,4.98,5.01,5.33,4.77,4.1]
    }'
  },
  '/marketstatistics/inventory' => {
    get: '{
      "Dates": ["11/1/2010","10/1/2010","9/1/2010","8/1/2010","7/1/2010", "6/1/2010","5/1/2010","4/1/2010","3/1/2010","2/1/2010", "1/1/2010","12/1/2009"],
      "ActiveListings": [10000,10005,10010,10015,9998,10221,10125,10222,10315,10008,10009,10001],
      "NewListings":    [100,101,105,109,99,100,105,102,102,98,95,92],
      "PendedListings": [100,101,105,109,99,100,105,102,102,98,95,92],
      "SoldListings":   [100,101,105,109,99,100,105,102,102,98,95,92]
    }'
  },
  '/marketstatistics/price' => {
      get: '{
      "Dates":                  ["11/1/2010","10/1/2010","9/1/2010","8/1/2010","7/1/2010",
                                 "6/1/2010","5/1/2010","4/1/2010","3/1/2010","2/1/2010",
                                 "1/1/2010","12/1/2009"],
      "ActiveAverageListPrice": [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "NewAverageListPrice":    [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "PendedAverageListPrice": [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "SoldAverageListPrice":   [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "SoldAverageSoldPrice":   [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "ActiveMedianListPrice":  [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "NewMedianListPrice":     [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "PendedMedianListPrice":  [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "SoldMedianListPrice":    [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000],
      "SoldMedianSoldPrice":    [100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000,100000]
    }'
  },
  '/marketstatistics/ratio' => {
      get: '{
      "Dates":                        ["11/1/2010","10/1/2010","9/1/2010","8/1/2010","7/1/2010",
                                       "6/1/2010","5/1/2010","4/1/2010","3/1/2010","2/1/2010",
                                       "1/1/2010","12/1/2009"],
      "SaleToOriginalListPriceRatio": [0.9834,0.9941,0.9898,0.9834,0.9941,0.9898,0.9834,0.9941,0.9898,0.9834,0.9941,0.9898],
      "SaleToListPriceRatio":         [0.9834,0.9941,0.9898,0.9834,0.9941,0.9898,0.9834,0.9941,0.9898,0.9834,0.9941,0.9898]
    }'
  },
  '/marketstatistics/dom' => {
      get: '{
      "Dates":       ["11/1/2010","10/1/2010","9/1/2010","8/1/2010","7/1/2010",
                      "6/1/2010","5/1/2010","4/1/2010","3/1/2010","2/1/2010",
                      "1/1/2010","12/1/2009"],
      "AverageDom":  [100,99,98,97,95,91,101,112,92,88,89,90],
      "AverageCdom": [100,99,98,97,95,91,101,112,92,88,89,90]
    }'
  },
  '/marketstatistics/volume' => {
      get: '{
      "Dates":["11/1/2010","10/1/2010","9/1/2010","8/1/2010","7/1/2010",
        "6/1/2010","5/1/2010","4/1/2010","3/1/2010","2/1/2010",
        "1/1/2010","12/1/2009"],
      "ActiveListVolume":[135650975,155736691,144529581,135650975,155736691,144529581,
      135650975,155736691,144529581,135650975,155736691,144529581],
      "NewListVolume":[135650975,155736691,144529581,135650975,155736691,144529581,
      135650975,155736691,144529581,135650975,155736691,144529581],
      "PendedListVolume":[135650975,155736691,144529581,135650975,155736691,144529581,
      135650975,155736691,144529581,135650975,155736691,144529581],
      "SoldListVolume":[135650975,155736691,144529581,135650975,155736691,144529581,
      135650975,155736691,144529581,135650975,155736691,144529581],
      "SoldSaleVolume":[135650975,155736691,144529581,135650975,155736691,144529581,
      135650975,155736691,144529581,135650975,155736691,144529581]
    }'
  },
  '/notifications' => {
    get: '{
      "D": {
        "Results": [{
          "Id":                "20100000000000000000000000",
          "Type":              "OperationComplete",
          "SenderApplication": "My Application",
          "SenderId":          "20100000000000000000000001",
          "RecipientId":       "20100000000000000000000002",
          "Message":           "Your PDF generation has completed!",
          "BrowserUri":        "http://myapplication.com/cmas/19581825.pdf",
          "ResourceUri":       "http://myapplication.com/cmas/19581825.json",
          "Read":              false,
          "CreatedTimestamp":  2011-11-18T16:35:43,
          "ReadTimestamp":     null
        }],
        "Success": true
      }
    }'
  },
  '/portal' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [{
          "ResourceUri": "/v1/portal/20100912153422758914000000",
          "Id": "20100912153422758914000000",
          "OwnerId": "20110000000000000000000001",
          "ModificationTimestamp": 2011-11-18T16:35:43,
          "Name": "greatportal",
          "DisplayName": "GreatPortal",
          "Enabled": true,
          "RequiredFields": ["Address", "Phone"]
        }]
      }
    }'
  },
  '/connect/prefs' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "Name": "RequiredFields",
            "Value": [
              "name",
              "email",
              "address",
              "phone"
            ]
          },
          {
            "Name": "OtherPref",
            "Value": "OtherValue"
          }
        ]
      }
    }'
  },
  '/propertytypes' => {
    get: '{
      "D": {
        "Success": true,
        "Results": [
          {
            "MlsName": "Residential",
            "MlsCode": "A",
            "RentalCalendar": false
          },
          {
            "MlsName": "Multi Family",
            "MlsCode": "B",
            "RentalCalendar": false
          },
          {
            "MlsName": "Land",
            "MlsCode": "C",
            "RentalCalendar": false
          },
          {
            "MlsName": "Commercial",
            "MlsCode": "D",
            "RentalCalendar": false
          },
          {
            "MlsName": "Farm",
            "MlsCode": "E",
            "RentalCalendar": false
          },
          {
            "MlsName": "Rental",
            "MlsCode": "F",
            "RentalCalendar": true
          }
        ]
      }
    }'
  },
  "/savedsearches" => { get: <<-eos
  {
  "D": {
  "Success": true,
  "Results": [
  {
  "ResourceUri": "/v1/savedsearches/20120709211054402696000000",
  "Name": "All Residential Listings",
  "OwnerId": "20110325213944541276000000",
  "Id": "20120709211054402696000000",
  "Filter": null,
  "ModificationTimestamp": "2012-07-09T16:10:54-05:00",
  "Description": ""
  },
  {
  "ResourceUri": "/v1/savedsearches/20110418145731906410000000",
  "Name": "Homes $100-$200k",
  "OwnerId": "20110325213944541276000000",
  "Id": "20110418145731906410000000",
  "Filter": null,
  "ModificationTimestamp": "2011-04-18T09:57:31-05:00",
  "Description": ""
  },
  {
  "ResourceUri": "/v1/savedsearches/20110418145645227747000000",
  "Name": "Search Results",
  "OwnerId": "20110325213944541276000000",
  "Id": "20110418145645227747000000",
  "Filter": null,
  "ModificationTimestamp": "2011-04-18T09:56:45-05:00",
  "Description": ""
  }
  ]
  }
  }
  eos,

  post: <<-eos
  {
  "D": {
  "Success": true
  }
  }
  eos
  },

  "/savedsearches/1" => { get: <<-eos
  {
  "D": {
  "Results": [
  {
  "ResourceUri": "/v1/savedsearches/20110418145731906410000000",
  "Name": "Homes $100-$200k",
  "OwnerId": "20110325213944541276000000",
  "Id": "20110418145731906410000000",
  "Filter": null,
  "ModificationTimestamp": "2011-04-18T09:57:31-05:00",
  "Description": ""
  }
  ],
  "Success": true
  }
  }
  eos,

  put: <<-eos
  {
  "D": {
  "Success": true
  }
  }
  eos,

  delete: <<-eos
  {
  "D": {
  "Success": true
  }
  }
  eos
  },

  "/sharedlistings" => { post: <<-eos
  {
  "D": {
  "Success": true,
  "Results": [
  {
  "Id": "15Ar",
  "ResourceUri":  "/v1/sharedlistings/15Ar",
  "SharedUri":  "http://www.flexmls.com/share/15Ar/3544-N-Olsen-Avenue-Filabee-AZ-85719",
  "ListingIds": ["20110224152431857619000000","20110125122333785431000000"],
  "Mode": "Public"
  }
  ]
  }
  }
  eos,

  get: <<-eos
  {
  "D": {
  "Success": true,
  "Results": [
  {
  "Id": "15Ar",
  "ResourceUri":  "/v1/sharedlistings/15Ar",
  "SharedUri":  "http://www.flexmls.com/share/15Ar/3544-N-Olsen-Avenue-Filabee-AZ-85719",
  "ListingIds": ["20110224152431857619000000","20110125122333785431000000"],
  "Mode": "Public"
  }
  ]
  }
  }
  eos
  },

  "/sharedlistings/1" => { get: <<-eos
  {
  "D": {
  "Success": true,
  "Results": [
  {
  "Id": "15Ar",
  "ResourceUri":  "/v1/sharedlistings/15Ar",
  "SharedUri":  "http://www.flexmls.com/share/15Ar/3544-N-Olsen-Avenue-Filabee-AZ-85719",
  "ListingIds": ["20110224152431857619000000","20110125122333785431000000"],
  "Mode": "Public"
  }
  ]
  }
  }
  eos
  },

  "/mls/1/standardfields/StreetSuffix" => { type: <<-eos
  {
  "D": {
  "Results": [
  {
  "StreetSuffix": {
  "ResourceUri": "/v1/standardfields/StreetSuffix",
  "FieldList": [
  {
  "Name": "ALY",
  "Value": "ALY"
  },
  {
  "Name": "AVE",
  "Value": "AVE"
  },
  {
  "Name": "BLVD",
  "Value": "BLVD"
  },
  {
  "Name": "CIR",
  "Value": "CIR"
  },
  {
  "Name": "CT",
  "Value": "CT"
  },
  {
  "Name": "DR",
  "Value": "DR"
  },
  {
  "Name": "LN",
  "Value": "LN"
  },
  {
  "Name": "LP",
  "Value": "LP"
  },
  {
  "Name": "PLACE",
  "Applies To": [
  "A"
  ],
  "Value": "PL"
  },
  {
  "Name": "RD",
  "Value": "RD"
  },
  {
  "Name": "ST",
  "Value": "ST"
  },
  {
  "Name": "TRL",
  "Applies To": [
  "A"
  ],
  "Value": "TRL"
  }
  ],
  "HasList": true,
  "MaxListSize": 13,
  "Searchable": true,
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ],
  "Type": "Character"
  }
  }
  ],
  "Success": true
  }
  }
  eos
  },

  "/standardfields/StreetSuffix" => { type: <<-eos
  {
  "D": {
  "Results": [
  {
  "StreetSuffix": {
  "ResourceUri": "/v1/standardfields/StreetSuffix",
  "FieldList": [
  {
  "Name": "ALY",
  "Value": "ALY"
  },
  {
  "Name": "AVE",
  "Value": "AVE"
  },
  {
  "Name": "BLVD",
  "Value": "BLVD"
  },
  {
  "Name": "CIR",
  "Value": "CIR"
  },
  {
  "Name": "CT",
  "Value": "CT"
  },
  {
  "Name": "DR",
  "Value": "DR"
  },
  {
  "Name": "LN",
  "Value": "LN"
  },
  {
  "Name": "LP",
  "Value": "LP"
  },
  {
  "Name": "PLACE",
  "Applies To": [
  "A"
  ],
  "Value": "PL"
  },
  {
  "Name": "RD",
  "Value": "RD"
  },
  {
  "Name": "ST",
  "Value": "ST"
  },
  {
  "Name": "TRL",
  "Applies To": [
  "A"
  ],
  "Value": "TRL"
  }
  ],
  "HasList": true,
  "MaxListSize": 13,
  "Searchable": true,
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ],
  "Type": "Character"
  }
  }
  ],
  "Success": true
  }
  }
  eos
  },
  "/mls/1/standardfields" => { type: <<-eos
  {
  "D": {
  "Results": [
  {
  "StreetSuffix": {
  "ResourceUri": "/v1/standardfields/StreetSuffix",
  "HasList": true,
  "MaxListSize": 13,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "MLSAreaMinor": {
  "ResourceUri": "/v1/standardfields/MLSAreaMinor",
  "HasList": true,
  "MaxListSize": 15,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "StreetNumber": {
  "ResourceUri": "/v1/standardfields/StreetNumber",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "ListAgentId": {
  "ResourceUri": "/v1/standardfields/ListAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "E"
  ]
  },
  "CoListAgentId": {
  "ResourceUri": "/v1/standardfields/CoListAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": []
  },
  "ListingId": {
  "ResourceUri": "/v1/standardfields/ListingId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "City": {
  "ResourceUri": "/v1/standardfields/City",
  "HasList": true,
  "MaxListSize": 102,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "Longitude": {
  "ResourceUri": "/v1/standardfields/Longitude",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": []
  },
  "ListOfficeId": {
  "ResourceUri": "/v1/standardfields/ListOfficeId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "CoListOfficeId": {
  "ResourceUri": "/v1/standardfields/CoListOfficeId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": []
  },
  "StreetName": {
  "ResourceUri": "/v1/standardfields/StreetName",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "YearBuilt": {
  "ResourceUri": "/v1/standardfields/YearBuilt",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "BuildingAreaTotal": {
  "ResourceUri": "/v1/standardfields/BuildingAreaTotal",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": [
  "A",
  "B",
  "D"
  ]
  },
  "PublicRemarks": {
  "ResourceUri": "/v1/standardfields/PublicRemarks",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "BuyerAgentId": {
  "ResourceUri": "/v1/standardfields/BuyerAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "PostalCode": {
  "ResourceUri": "/v1/standardfields/PostalCode",
  "HasList": true,
  "MaxListSize": 229,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "ListPrice": {
  "ResourceUri": "/v1/standardfields/ListPrice",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "SubdivisionName": {
  "ResourceUri": "/v1/standardfields/SubdivisionName",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "WithdrawDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/WithdrawDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "BathsThreeQuarter": {
  "ResourceUri": "/v1/standardfields/BathsThreeQuarter",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": []
  },
  "Latitude": {
  "ResourceUri": "/v1/standardfields/Latitude",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": []
  },
  "CloseDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/CloseDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "MlsStatusInformation": {
  "ResourceUri": "/v1/standardfields/MlsStatusInformation",
  "HasList": true,
  "MaxListSize": 4,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": []
  },
  "StreetDirPrefix": {
  "ResourceUri": "/v1/standardfields/StreetDirPrefix",
  "HasList": true,
  "MaxListSize": 9,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "StreetAdditionalInfo": {
  "ResourceUri": "/v1/standardfields/StreetAdditionalInfo",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "PropertyType": {
  "ResourceUri": "/v1/standardfields/PropertyType",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "StateOrProvince": {
  "ResourceUri": "/v1/standardfields/StateOrProvince",
  "HasList": true,
  "MaxListSize": 2,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "BathsTotal": {
  "ResourceUri": "/v1/standardfields/BathsTotal",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": [
  "A",
  "E"
  ]
  },
  "BathsFull": {
  "ResourceUri": "/v1/standardfields/BathsFull",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A"
  ]
  },
  "MlsId": {
  "ResourceUri": "/v1/standardfields/MlsId",
  "HasList": true,
  "MaxListSize": 0,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": []
  },
  "ListingKey": {
  "ResourceUri": "/v1/standardfields/ListingKey",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "CoBuyerAgentId": {
  "ResourceUri": "/v1/standardfields/CoBuyerAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "PendingDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/PendingDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "StreetDirSuffix": {
  "ResourceUri": "/v1/standardfields/StreetDirSuffix",
  "HasList": true,
  "MaxListSize": 9,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "BedsTotal": {
  "ResourceUri": "/v1/standardfields/BedsTotal",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A",
  "E"
  ]
  },
  "CancelDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/CancelDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "ModificationTimestamp": {
  "ResourceUri": "/v1/standardfields/ModificationTimestamp",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Datetime",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "MlsStatus": {
  "ResourceUri": "/v1/standardfields/MlsStatus",
  "HasList": true,
  "MaxListSize": 7,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "ClosePrice": {
  "ResourceUri": "/v1/standardfields/ClosePrice",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": []
  },
  "BathsHalf": {
  "ResourceUri": "/v1/standardfields/BathsHalf",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A"
  ]
  },
  "PropertySubType": {
  "ResourceUri": "/v1/standardfields/PropertySubType",
  "HasList": true,
  "MaxListSize": 7,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "PrivateRemarks": {
  "ResourceUri": "/v1/standardfields/PrivateRemarks",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": []
  },
  "CountyOrParish": {
  "ResourceUri": "/v1/standardfields/CountyOrParish",
  "HasList": true,
  "MaxListSize": 56,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  }
  }
  ],
  "Success": true
  }
  }
  eos
  },

  "/standardfields" => { type: <<-eos
  {
  "D": {
  "Results": [
  {
  "StreetSuffix": {
  "ResourceUri": "/v1/standardfields/StreetSuffix",
  "HasList": true,
  "MaxListSize": 13,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "MLSAreaMinor": {
  "ResourceUri": "/v1/standardfields/MLSAreaMinor",
  "HasList": true,
  "MaxListSize": 15,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "StreetNumber": {
  "ResourceUri": "/v1/standardfields/StreetNumber",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "ListAgentId": {
  "ResourceUri": "/v1/standardfields/ListAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "E"
  ]
  },
  "CoListAgentId": {
  "ResourceUri": "/v1/standardfields/CoListAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": []
  },
  "ListingId": {
  "ResourceUri": "/v1/standardfields/ListingId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "City": {
  "ResourceUri": "/v1/standardfields/City",
  "HasList": true,
  "MaxListSize": 102,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "Longitude": {
  "ResourceUri": "/v1/standardfields/Longitude",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": []
  },
  "ListOfficeId": {
  "ResourceUri": "/v1/standardfields/ListOfficeId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "CoListOfficeId": {
  "ResourceUri": "/v1/standardfields/CoListOfficeId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": []
  },
  "StreetName": {
  "ResourceUri": "/v1/standardfields/StreetName",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "YearBuilt": {
  "ResourceUri": "/v1/standardfields/YearBuilt",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "BuildingAreaTotal": {
  "ResourceUri": "/v1/standardfields/BuildingAreaTotal",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": [
  "A",
  "B",
  "D"
  ]
  },
  "PublicRemarks": {
  "ResourceUri": "/v1/standardfields/PublicRemarks",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "BuyerAgentId": {
  "ResourceUri": "/v1/standardfields/BuyerAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "PostalCode": {
  "ResourceUri": "/v1/standardfields/PostalCode",
  "HasList": true,
  "MaxListSize": 229,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "ListPrice": {
  "ResourceUri": "/v1/standardfields/ListPrice",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "SubdivisionName": {
  "ResourceUri": "/v1/standardfields/SubdivisionName",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "WithdrawDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/WithdrawDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "BathsThreeQuarter": {
  "ResourceUri": "/v1/standardfields/BathsThreeQuarter",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": []
  },
  "Latitude": {
  "ResourceUri": "/v1/standardfields/Latitude",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": []
  },
  "CloseDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/CloseDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "MlsStatusInformation": {
  "ResourceUri": "/v1/standardfields/MlsStatusInformation",
  "HasList": true,
  "MaxListSize": 4,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": []
  },
  "StreetDirPrefix": {
  "ResourceUri": "/v1/standardfields/StreetDirPrefix",
  "HasList": true,
  "MaxListSize": 9,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "StreetAdditionalInfo": {
  "ResourceUri": "/v1/standardfields/StreetAdditionalInfo",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "PropertyType": {
  "ResourceUri": "/v1/standardfields/PropertyType",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "StateOrProvince": {
  "ResourceUri": "/v1/standardfields/StateOrProvince",
  "HasList": true,
  "MaxListSize": 2,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "BathsTotal": {
  "ResourceUri": "/v1/standardfields/BathsTotal",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": [
  "A",
  "E"
  ]
  },
  "BathsFull": {
  "ResourceUri": "/v1/standardfields/BathsFull",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A"
  ]
  },
  "MlsId": {
  "ResourceUri": "/v1/standardfields/MlsId",
  "HasList": true,
  "MaxListSize": 0,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": []
  },
  "ListingKey": {
  "ResourceUri": "/v1/standardfields/ListingKey",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "CoBuyerAgentId": {
  "ResourceUri": "/v1/standardfields/CoBuyerAgentId",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "PendingDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/PendingDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "StreetDirSuffix": {
  "ResourceUri": "/v1/standardfields/StreetDirSuffix",
  "HasList": true,
  "MaxListSize": 9,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "BedsTotal": {
  "ResourceUri": "/v1/standardfields/BedsTotal",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A",
  "E"
  ]
  },
  "CancelDate": {
  "Defaults": {
  "FromQuantity": 1,
  "FromUnit": "years",
  "ToQuantity": 10,
  "ToUnit": "years"
  },
  "ResourceUri": "/v1/standardfields/CancelDate",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Date",
  "MlsVisible": []
  },
  "ModificationTimestamp": {
  "ResourceUri": "/v1/standardfields/ModificationTimestamp",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Datetime",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "MlsStatus": {
  "ResourceUri": "/v1/standardfields/MlsStatus",
  "HasList": true,
  "MaxListSize": 7,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  },
  "ClosePrice": {
  "ResourceUri": "/v1/standardfields/ClosePrice",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Decimal",
  "MlsVisible": []
  },
  "BathsHalf": {
  "ResourceUri": "/v1/standardfields/BathsHalf",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": true,
  "Type": "Integer",
  "MlsVisible": [
  "A"
  ]
  },
  "PropertySubType": {
  "ResourceUri": "/v1/standardfields/PropertySubType",
  "HasList": true,
  "MaxListSize": 7,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D"
  ]
  },
  "PrivateRemarks": {
  "ResourceUri": "/v1/standardfields/PrivateRemarks",
  "HasList": false,
  "MaxListSize": 0,
  "Searchable": false,
  "Type": "Character",
  "MlsVisible": []
  },
  "CountyOrParish": {
  "ResourceUri": "/v1/standardfields/CountyOrParish",
  "HasList": true,
  "MaxListSize": 56,
  "Searchable": true,
  "Type": "Character",
  "MlsVisible": [
  "A",
  "B",
  "C",
  "D",
  "E"
  ]
  }
  }
  ],
  "Success": true
  }
  }
  eos
  },

  "/standardfields/nearby/1" => { get: <<-eos
  {
  "D": {
  "Success": true,
  "Results": [
  {
  "PropertySubType": {
  "Label": "Property Sub-Type",
  "Searchable": true,
  "Type": "Character",
  "ResourceUri": "/v1/standardfields/PropertySubtype",
  "MlsVisible": {
  "PropertyTypes": ["A","B","C"]
  },
  "HasList": true,
  "FieldList": [
  {
  "Value": "SF",
  "Name": "Single Family",
  "AppliesTo": [
  "A",
  "B",
  "C"
  ]
  },
  {
  "Value": "CD",
  "Name": "Condo",
  "AppliesTo": [
  "A",
  "B",
  "C"
  ]
  },
  {
  "Value": "CO",
  "Name": "Commercial",
  "AppliesTo": [
  "D"
  ]
  }
  ]
  }
  }
  ]
  }
  }
  eos
  },

  "/system" => { get: <<-eos
  {
  "D": {
  "Results": [
  {
  "Name": "Developer Development Key",
  "OfficeId": "20061018203347428240000000",
  "Configuration": [
  {
  "ExtendedActiveStatuses": {
  "Enabled": false
  },
  "ExtendedPendingStatuses": {
  "Enabled": false
  },
  "MlsLogos": [],
  "TimeZoneOffset": "-0600",
  "TimeZone": "Mountain Time (US & Canada)",
  "CurrencyType": "USD",
  "IdxDisclaimer": "Search results are produced through the Great Falls Association of REALTORS IDX program. All inforation is provided exclusively for consumers' personal, non-commercial use and may not be used for y purpose other than to identify prospective properties consumers may be interested in purchasing. Information is deemed reliable but not guaranteed and should be independently verified. Great Falls Association of REALTORS",
  "OAuth2ServiceEndpointPortal": "https://sparkplatform.com/auth/vow/dgtfdeveloper",
  "OAuth2ServiceEndpointPrivate": "https://sparkplatform.com/oauth2",
  "TimeZoneAbbreviation": "MDT",
  "IdxLogoSmall": "",
  "IdxLogo": ""
  }
  ],
  "Id": "20110325213944541276000000",
  "MlsId": "20090403000000000001000000",
  "Office": "A-NON MEMBER OFFICE",
  "DisplayCompliance": {
  "20090403000000000001000000": {
  "DisclaimerText": "Search results are produced through the Great Falls Association of REALTORS IDX program. All inforation is provided exclusively for consumers' personal, non-commercial use and may not be used for y purpose other than to identify prospective properties consumers may be interested in purchasing. Information is deemed reliable but not guaranteed and should be independently verified. Great Falls Association of REALTORS",
  "View": {
  "Summary": {
  "DisplayCompliance": [
  "ListOfficeName"
  ]
  },
  "Detail": {
  "DisplayCompliance": [
  "ListOfficeName"
  ]
  }
  }
  }
  },
  "Mls": "Demo MLS"
  }
  ],
  "Success": true
  }
  }
  eos
  },

  "/system/accounts" => { get: <<-eos
  {
  "D": {
  "Success": true,
  "Results": [
  {
  "Designations": [
  {
  "Code": "AB",
  "Name": "Associate Broker",
  "Editable": true
  }
  ]
  }
  ]
  }
  }
  eos
  },

  "/system/languages" => {
    get: <<-eos
      {
        "D": {
          "Success": true,
          "Results": [
            {"Name": "English"},
            {"Name": "Spanish"},
            {"Name": "Chinese, Mandarin"}
          ]
        }
      }
    eos
  }
}

  def show_stubs
    puts MOCK_RESPONSES.keys
  end

  def stub_request(request_type, request_uri, options={})
    uri_prefix = 'https://developers.sparkapi.com/v1'
    "#{uri_prefix}#{MOCK_RESPONSES[request_uri][request_type]}"
  end

  def self.get request_uri, options={}
    # if get request on existing uri
    if MOCK_RESPONSES[request_uri] && MOCK_RESPONSES[request_uri][:get]
      result =  "#{MOCK_RESPONSES[request_uri][:get]}"

    # if get request does not exist on existing uri
    elsif MOCK_RESPONSES[request_uri] && !MOCK_RESPONSES[request_uri][:get]
      result = '{
        "D": {
          "Success": false,
          "Code": 405,
          "Message": "Not implemented"
        }
      }'
    # when the uri does not exist
    else
      result = '{
        "D": {
          "Success": false,
          "Code": 404,
          "Message": "Not Found"
        }
      }'
    end
  end
end