//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSIoTResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSIoTResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSIoTResources

+ (instancetype)sharedInstance {
    static AWSIoTResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSIoTResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"uid\":\"iot-2015-05-28\",\
    \"apiVersion\":\"2015-05-28\",\
    \"endpointPrefix\":\"iot\",\
    \"serviceFullName\":\"AWS IoT\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"execute-api\",\
    \"protocol\":\"rest-json\"\
  },\
  \"documentation\":\"<fullname>AWS IoT</fullname> <p>AWS IoT provides secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the AWS cloud. You can discover your custom IoT-Data endpoint to communicate with, configure rules for data processing and integration with other services, organize resources associated with each thing (Thing Registry), configure logging, and create and manage policies and credentials to authenticate things.</p> <p>For more information about how AWS IoT works, see the <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html\\\">Developer Guide</a>.</p>\",\
  \"operations\":{\
    \"AcceptCertificateTransfer\":{\
      \"name\":\"AcceptCertificateTransfer\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/accept-certificate-transfer/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"AcceptCertificateTransferRequest\",\
        \"documentation\":\"<p>The input for the AcceptCertificateTransfer operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"TransferAlreadyCompletedException\",\
          \"error\":{\"httpStatusCode\":410},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't revert the certificate transfer because the transfer is already complete.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Accepts a pending certificate transfer. The default state of the certificate is INACTIVE.</p> <p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p>\"\
    },\
    \"AttachPrincipalPolicy\":{\
      \"name\":\"AttachPrincipalPolicy\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/principal-policies/{policyName}\"\
      },\
      \"input\":{\
        \"shape\":\"AttachPrincipalPolicyRequest\",\
        \"documentation\":\"<p>The input for the AttachPrincipalPolicy operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"LimitExceededException\",\
          \"error\":{\"httpStatusCode\":410},\
          \"exception\":true,\
          \"documentation\":\"<p>The number of attached entities exceeds the limit.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Attaches the specified policy to the specified principal (certificate or other credential).</p>\"\
    },\
    \"AttachThingPrincipal\":{\
      \"name\":\"AttachThingPrincipal\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/things/{thingName}/principals\"\
      },\
      \"input\":{\
        \"shape\":\"AttachThingPrincipalRequest\",\
        \"documentation\":\"<p>The input for the AttachThingPrincipal operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"AttachThingPrincipalResponse\",\
        \"documentation\":\"<p>The output from the AttachThingPrincipal operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Attaches the specified principal to the specified thing.</p>\"\
    },\
    \"CancelCertificateTransfer\":{\
      \"name\":\"CancelCertificateTransfer\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/cancel-certificate-transfer/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"CancelCertificateTransferRequest\",\
        \"documentation\":\"<p>The input for the CancelCertificateTransfer operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"TransferAlreadyCompletedException\",\
          \"error\":{\"httpStatusCode\":410},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't revert the certificate transfer because the transfer is already complete.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Cancels a pending transfer for the specified certificate.</p> <p><b>Note</b> Only the transfer source account can use this operation to cancel a transfer. (Transfer destinations can use <a>RejectCertificateTransfer</a> instead.) After transfer, AWS IoT returns the certificate to the source account in the INACTIVE state. After the destination account has accepted the transfer, the transfer cannot be cancelled.</p> <p>After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.</p>\"\
    },\
    \"CreateCertificateFromCsr\":{\
      \"name\":\"CreateCertificateFromCsr\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/certificates\"\
      },\
      \"input\":{\
        \"shape\":\"CreateCertificateFromCsrRequest\",\
        \"documentation\":\"<p>The input for the CreateCertificateFromCsr operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"CreateCertificateFromCsrResponse\",\
        \"documentation\":\"<p>The output from the CreateCertificateFromCsr operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates an X.509 certificate using the specified certificate signing request.</p> <p><b>Note</b> Reusing the same certificate signing request (CSR) results in a distinct certificate.</p> <p>You can create multiple certificates in a batch by creating a directory, copying multiple .csr files into that directory, and then specifying that directory on the command line. The following commands show how to create a batch of certificates given a batch of CSRs. </p> <p>Assuming a set of CSRs are located inside of the directory my-csr-directory:</p> <p>On Linux and OS X, the command is:</p> <p>$ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{}</p> <p> This command lists all of the CSRs in my-csr-directory and pipes each CSR file name to the aws iot create-certificate-from-csr AWS CLI command to create a certificate for the corresponding CSR. </p> <p> The aws iot create-certificate-from-csr part of the command can also be run in parallel to speed up the certificate creation process: </p> <p> $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} </p> <p> On Windows PowerShell, the command to create certificates for all CSRs in my-csr-directory is: </p> <p> &gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/$_} </p> <p> On a Windows command prompt, the command to create certificates for all CSRs in my-csr-directory is: </p> <p> &gt; forfiles /p my-csr-directory /c \\\"cmd /c aws iot create-certificate-from-csr --certificate-signing-request file://@path\\\"</p>\"\
    },\
    \"CreateKeysAndCertificate\":{\
      \"name\":\"CreateKeysAndCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/keys-and-certificate\"\
      },\
      \"input\":{\
        \"shape\":\"CreateKeysAndCertificateRequest\",\
        \"documentation\":\"<p>The input for the CreateKeysAndCertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"CreateKeysAndCertificateResponse\",\
        \"documentation\":\"<p>The output of the CreateKeysAndCertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates a 2048-bit RSA key pair and issues an X.509 certificate using the issued public key.</p> <p><b>Note</b> This is the only time AWS IoT issues the private key for this certificate, so it is important to keep it in a secure location.</p>\"\
    },\
    \"CreatePolicy\":{\
      \"name\":\"CreatePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/policies/{policyName}\"\
      },\
      \"input\":{\
        \"shape\":\"CreatePolicyRequest\",\
        \"documentation\":\"<p>The input for the CreatePolicy operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"CreatePolicyResponse\",\
        \"documentation\":\"<p>The output from the CreatePolicy operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceAlreadyExistsException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The resource already exists.</p>\"\
        },\
        {\
          \"shape\":\"MalformedPolicyException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The policy documentation is not valid.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates an AWS IoT policy.</p> <p>The created policy is the default version for the policy. This operation creates a policy version with a version identifier of <b>1</b> and sets <b>1</b> as the policy's default version.</p>\"\
    },\
    \"CreatePolicyVersion\":{\
      \"name\":\"CreatePolicyVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/policies/{policyName}/version\"\
      },\
      \"input\":{\
        \"shape\":\"CreatePolicyVersionRequest\",\
        \"documentation\":\"<p>The input for the CreatePolicyVersion operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"CreatePolicyVersionResponse\",\
        \"documentation\":\"<p>The output of the CreatePolicyVersion operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"MalformedPolicyException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The policy documentation is not valid.</p>\"\
        },\
        {\
          \"shape\":\"VersionsLimitExceededException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The number of policy versions exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates a new version of the specified AWS IoT policy. To update a policy, create a new policy version. A managed policy can have up to five versions. If the policy has five versions, you must use <a>DeletePolicyVersion</a> to delete an existing version before you create a new one.</p> <p>Optionally, you can set the new version as the policy's default version. The default version is the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>\"\
    },\
    \"CreateThing\":{\
      \"name\":\"CreateThing\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\
        \"shape\":\"CreateThingRequest\",\
        \"documentation\":\"<p>The input for the CreateThing operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"CreateThingResponse\",\
        \"documentation\":\"<p>The output of the CreateThing operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceAlreadyExistsException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The resource already exists.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates a thing record in the thing registry.</p>\"\
    },\
    \"CreateThingType\":{\
      \"name\":\"CreateThingType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/thing-types/{thingTypeName}\"\
      },\
      \"input\":{\
        \"shape\":\"CreateThingTypeRequest\",\
        \"documentation\":\"<p>The input for the CreateThingType operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"CreateThingTypeResponse\",\
        \"documentation\":\"<p>The output of the CreateThingType operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceAlreadyExistsException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The resource already exists.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates a new thing type.</p>\"\
    },\
    \"CreateTopicRule\":{\
      \"name\":\"CreateTopicRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\
        \"shape\":\"CreateTopicRuleRequest\",\
        \"documentation\":\"<p>The input for the CreateTopicRule operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"SqlParseException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\"\
        },\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ResourceAlreadyExistsException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The resource already exists.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Creates a rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p>\"\
    },\
    \"DeleteCACertificate\":{\
      \"name\":\"DeleteCACertificate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/cacertificate/{caCertificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteCACertificateRequest\",\
        \"documentation\":\"<p>Input for the DeleteCACertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DeleteCACertificateResponse\",\
        \"documentation\":\"<p>The output for the DeleteCACertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"CertificateStateException\",\
          \"error\":{\"httpStatusCode\":406},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes a registered CA certificate.</p>\"\
    },\
    \"DeleteCertificate\":{\
      \"name\":\"DeleteCertificate\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/certificates/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteCertificateRequest\",\
        \"documentation\":\"<p>The input for the DeleteCertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"CertificateStateException\",\
          \"error\":{\"httpStatusCode\":406},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\"\
        },\
        {\
          \"shape\":\"DeleteConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specified certificate.</p> <p>A certificate cannot be deleted if it has a policy attached to it or if its status is set to ACTIVE. To delete a certificate, first use the <a>DetachPrincipalPolicy</a> API to detach all policies. Next, use the <a>UpdateCertificate</a> API to set the certificate to the INACTIVE status.</p>\"\
    },\
    \"DeletePolicy\":{\
      \"name\":\"DeletePolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/policies/{policyName}\"\
      },\
      \"input\":{\
        \"shape\":\"DeletePolicyRequest\",\
        \"documentation\":\"<p>The input for the DeletePolicy operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"DeleteConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specified policy.</p> <p>A policy cannot be deleted if it has non-default versions or it is attached to any certificate.</p> <p>To delete a policy, use the DeletePolicyVersion API to delete all non-default versions of the policy; use the DetachPrincipalPolicy API to detach the policy from any certificate; and then use the DeletePolicy API to delete the policy.</p> <p>When a policy is deleted using DeletePolicy, its default version is deleted with it.</p>\"\
    },\
    \"DeletePolicyVersion\":{\
      \"name\":\"DeletePolicyVersion\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\"\
      },\
      \"input\":{\
        \"shape\":\"DeletePolicyVersionRequest\",\
        \"documentation\":\"<p>The input for the DeletePolicyVersion operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"DeleteConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specified version of the specified policy. You cannot delete the default version of a policy using this API. To delete the default version of a policy, use <a>DeletePolicy</a>. To find out which version of a policy is marked as the default version, use ListPolicyVersions.</p>\"\
    },\
    \"DeleteRegistrationCode\":{\
      \"name\":\"DeleteRegistrationCode\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/registrationcode\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteRegistrationCodeRequest\",\
        \"documentation\":\"<p>The input for the DeleteRegistrationCode operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DeleteRegistrationCodeResponse\",\
        \"documentation\":\"<p>The output for the DeleteRegistrationCode operation. </p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes a CA certificate registration code.</p>\"\
    },\
    \"DeleteThing\":{\
      \"name\":\"DeleteThing\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteThingRequest\",\
        \"documentation\":\"<p>The input for the DeleteThing operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DeleteThingResponse\",\
        \"documentation\":\"<p>The output of the DeleteThing operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"VersionConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>An exception thrown when the version of a thing passed to a command is different than the version specified with the --version parameter. </p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specified thing.</p>\"\
    },\
    \"DeleteThingType\":{\
      \"name\":\"DeleteThingType\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/thing-types/{thingTypeName}\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteThingTypeRequest\",\
        \"documentation\":\"<p>The input for the DeleteThingType operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DeleteThingTypeResponse\",\
        \"documentation\":\"<p>The output for the DeleteThingType operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specified thing type . You cannot delete a thing type if it has things associated with it. To delete a thing type, first mark it as deprecated by calling <a>DeprecateThingType</a>, then remove any associated things by calling <a>UpdateThing</a> to change the thing type on any associated thing, and finally use <a>DeleteThingType</a> to delete the thing type.</p>\"\
    },\
    \"DeleteTopicRule\":{\
      \"name\":\"DeleteTopicRule\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\
        \"shape\":\"DeleteTopicRuleRequest\",\
        \"documentation\":\"<p>The input for the DeleteTopicRule operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deletes the specified rule.</p>\"\
    },\
    \"DeprecateThingType\":{\
      \"name\":\"DeprecateThingType\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/thing-types/{thingTypeName}/deprecate\"\
      },\
      \"input\":{\
        \"shape\":\"DeprecateThingTypeRequest\",\
        \"documentation\":\"<p>The input for the DeprecateThingType operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DeprecateThingTypeResponse\",\
        \"documentation\":\"<p>The output for the DeprecateThingType operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Deprecates a thing type. You can not associate new things with deprecated thing type.</p>\"\
    },\
    \"DescribeCACertificate\":{\
      \"name\":\"DescribeCACertificate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/cacertificate/{caCertificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"DescribeCACertificateRequest\",\
        \"documentation\":\"<p>The input for the DescribeCACertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeCACertificateResponse\",\
        \"documentation\":\"<p>The output from the DescribeCACertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Describes a registered CA certificate.</p>\"\
    },\
    \"DescribeCertificate\":{\
      \"name\":\"DescribeCertificate\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"DescribeCertificateRequest\",\
        \"documentation\":\"<p>The input for the DescribeCertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeCertificateResponse\",\
        \"documentation\":\"<p>The output of the DescribeCertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets information about the specified certificate.</p>\"\
    },\
    \"DescribeEndpoint\":{\
      \"name\":\"DescribeEndpoint\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/endpoint\"\
      },\
      \"input\":{\
        \"shape\":\"DescribeEndpointRequest\",\
        \"documentation\":\"<p>The input for the DescribeEndpoint operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeEndpointResponse\",\
        \"documentation\":\"<p>The output from the DescribeEndpoint operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Returns a unique endpoint specific to the AWS account making the call.</p>\"\
    },\
    \"DescribeThing\":{\
      \"name\":\"DescribeThing\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\
        \"shape\":\"DescribeThingRequest\",\
        \"documentation\":\"<p>The input for the DescribeThing operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeThingResponse\",\
        \"documentation\":\"<p>The output from the DescribeThing operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets information about the specified thing.</p>\"\
    },\
    \"DescribeThingType\":{\
      \"name\":\"DescribeThingType\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-types/{thingTypeName}\"\
      },\
      \"input\":{\
        \"shape\":\"DescribeThingTypeRequest\",\
        \"documentation\":\"<p>The input for the DescribeThingType operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeThingTypeResponse\",\
        \"documentation\":\"<p>The output for the DescribeThingType operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets information about the specified thing type.</p>\"\
    },\
    \"DetachPrincipalPolicy\":{\
      \"name\":\"DetachPrincipalPolicy\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/principal-policies/{policyName}\"\
      },\
      \"input\":{\
        \"shape\":\"DetachPrincipalPolicyRequest\",\
        \"documentation\":\"<p>The input for the DetachPrincipalPolicy operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Removes the specified policy from the specified certificate.</p>\"\
    },\
    \"DetachThingPrincipal\":{\
      \"name\":\"DetachThingPrincipal\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}/principals\"\
      },\
      \"input\":{\
        \"shape\":\"DetachThingPrincipalRequest\",\
        \"documentation\":\"<p>The input for the DetachThingPrincipal operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"DetachThingPrincipalResponse\",\
        \"documentation\":\"<p>The output from the DetachThingPrincipal operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Detaches the specified principal from the specified thing.</p>\"\
    },\
    \"DisableTopicRule\":{\
      \"name\":\"DisableTopicRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{ruleName}/disable\"\
      },\
      \"input\":{\
        \"shape\":\"DisableTopicRuleRequest\",\
        \"documentation\":\"<p>The input for the DisableTopicRuleRequest operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Disables the specified rule.</p>\"\
    },\
    \"EnableTopicRule\":{\
      \"name\":\"EnableTopicRule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/rules/{ruleName}/enable\"\
      },\
      \"input\":{\
        \"shape\":\"EnableTopicRuleRequest\",\
        \"documentation\":\"<p>The input for the EnableTopicRuleRequest operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Enables the specified rule.</p>\"\
    },\
    \"GetLoggingOptions\":{\
      \"name\":\"GetLoggingOptions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/loggingOptions\"\
      },\
      \"input\":{\
        \"shape\":\"GetLoggingOptionsRequest\",\
        \"documentation\":\"<p>The input for the GetLoggingOptions operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetLoggingOptionsResponse\",\
        \"documentation\":\"<p>The output from the GetLoggingOptions operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets the logging options.</p>\"\
    },\
    \"GetPolicy\":{\
      \"name\":\"GetPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyName}\"\
      },\
      \"input\":{\
        \"shape\":\"GetPolicyRequest\",\
        \"documentation\":\"<p>The input for the GetPolicy operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetPolicyResponse\",\
        \"documentation\":\"<p>The output from the GetPolicy operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets information about the specified policy with the policy document of the default version.</p>\"\
    },\
    \"GetPolicyVersion\":{\
      \"name\":\"GetPolicyVersion\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\"\
      },\
      \"input\":{\
        \"shape\":\"GetPolicyVersionRequest\",\
        \"documentation\":\"<p>The input for the GetPolicyVersion operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetPolicyVersionResponse\",\
        \"documentation\":\"<p>The output from the GetPolicyVersion operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets information about the specified policy version.</p>\"\
    },\
    \"GetRegistrationCode\":{\
      \"name\":\"GetRegistrationCode\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/registrationcode\"\
      },\
      \"input\":{\
        \"shape\":\"GetRegistrationCodeRequest\",\
        \"documentation\":\"<p>The input to the GetRegistrationCode operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetRegistrationCodeResponse\",\
        \"documentation\":\"<p>The output from the GetRegistrationCode operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets a registration code used to register a CA certificate with AWS IoT.</p>\"\
    },\
    \"GetTopicRule\":{\
      \"name\":\"GetTopicRule\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\
        \"shape\":\"GetTopicRuleRequest\",\
        \"documentation\":\"<p>The input for the GetTopicRule operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"GetTopicRuleResponse\",\
        \"documentation\":\"<p>The output from the GetTopicRule operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Gets information about the specified rule.</p>\"\
    },\
    \"ListCACertificates\":{\
      \"name\":\"ListCACertificates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/cacertificates\"\
      },\
      \"input\":{\
        \"shape\":\"ListCACertificatesRequest\",\
        \"documentation\":\"<p>Input for the ListCACertificates operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListCACertificatesResponse\",\
        \"documentation\":\"<p>The output from the ListCACertificates operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the CA certificates registered for your AWS account.</p> <p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p>\"\
    },\
    \"ListCertificates\":{\
      \"name\":\"ListCertificates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates\"\
      },\
      \"input\":{\
        \"shape\":\"ListCertificatesRequest\",\
        \"documentation\":\"<p>The input for the ListCertificates operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListCertificatesResponse\",\
        \"documentation\":\"<p>The output of the ListCertificates operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the certificates registered in your AWS account.</p> <p>The results are paginated with a default page size of 25. You can use the returned marker to retrieve additional results.</p>\"\
    },\
    \"ListCertificatesByCA\":{\
      \"name\":\"ListCertificatesByCA\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates-by-ca/{caCertificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"ListCertificatesByCARequest\",\
        \"documentation\":\"<p>The input to the ListCertificatesByCA operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListCertificatesByCAResponse\",\
        \"documentation\":\"<p>The output of the ListCertificatesByCA operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>List the device certificates signed by the specified CA certificate.</p>\"\
    },\
    \"ListOutgoingCertificates\":{\
      \"name\":\"ListOutgoingCertificates\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/certificates-out-going\"\
      },\
      \"input\":{\
        \"shape\":\"ListOutgoingCertificatesRequest\",\
        \"documentation\":\"<p>The input to the ListOutgoingCertificates operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListOutgoingCertificatesResponse\",\
        \"documentation\":\"<p>The output from the ListOutgoingCertificates operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists certificates that are being transfered but not yet accepted.</p>\"\
    },\
    \"ListPolicies\":{\
      \"name\":\"ListPolicies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies\"\
      },\
      \"input\":{\
        \"shape\":\"ListPoliciesRequest\",\
        \"documentation\":\"<p>The input for the ListPolicies operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListPoliciesResponse\",\
        \"documentation\":\"<p>The output from the ListPolicies operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists your policies.</p>\"\
    },\
    \"ListPolicyPrincipals\":{\
      \"name\":\"ListPolicyPrincipals\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policy-principals\"\
      },\
      \"input\":{\
        \"shape\":\"ListPolicyPrincipalsRequest\",\
        \"documentation\":\"<p>The input for the ListPolicyPrincipals operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListPolicyPrincipalsResponse\",\
        \"documentation\":\"<p>The output from the ListPolicyPrincipals operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the principals associated with the specified policy.</p>\"\
    },\
    \"ListPolicyVersions\":{\
      \"name\":\"ListPolicyVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/policies/{policyName}/version\"\
      },\
      \"input\":{\
        \"shape\":\"ListPolicyVersionsRequest\",\
        \"documentation\":\"<p>The input for the ListPolicyVersions operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListPolicyVersionsResponse\",\
        \"documentation\":\"<p>The output from the ListPolicyVersions operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the versions of the specified policy and identifies the default version.</p>\"\
    },\
    \"ListPrincipalPolicies\":{\
      \"name\":\"ListPrincipalPolicies\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/principal-policies\"\
      },\
      \"input\":{\
        \"shape\":\"ListPrincipalPoliciesRequest\",\
        \"documentation\":\"<p>The input for the ListPrincipalPolicies operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListPrincipalPoliciesResponse\",\
        \"documentation\":\"<p>The output from the ListPrincipalPolicies operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the policies attached to the specified principal. If you use an Cognito identity, the ID must be in <a href=\\\"http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax\\\">AmazonCognito Identity format</a>.</p>\"\
    },\
    \"ListPrincipalThings\":{\
      \"name\":\"ListPrincipalThings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/principals/things\"\
      },\
      \"input\":{\
        \"shape\":\"ListPrincipalThingsRequest\",\
        \"documentation\":\"<p>The input for the ListPrincipalThings operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListPrincipalThingsResponse\",\
        \"documentation\":\"<p>The output from the ListPrincipalThings operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the things associated with the specified principal.</p>\"\
    },\
    \"ListThingPrincipals\":{\
      \"name\":\"ListThingPrincipals\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/principals\"\
      },\
      \"input\":{\
        \"shape\":\"ListThingPrincipalsRequest\",\
        \"documentation\":\"<p>The input for the ListThingPrincipal operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListThingPrincipalsResponse\",\
        \"documentation\":\"<p>The output from the ListThingPrincipals operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the principals associated with the specified thing.</p>\"\
    },\
    \"ListThingTypes\":{\
      \"name\":\"ListThingTypes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/thing-types\"\
      },\
      \"input\":{\
        \"shape\":\"ListThingTypesRequest\",\
        \"documentation\":\"<p>The input for the ListThingTypes operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListThingTypesResponse\",\
        \"documentation\":\"<p>The output for the ListThingTypes operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the existing thing types.</p>\"\
    },\
    \"ListThings\":{\
      \"name\":\"ListThings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things\"\
      },\
      \"input\":{\
        \"shape\":\"ListThingsRequest\",\
        \"documentation\":\"<p>The input for the ListThings operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListThingsResponse\",\
        \"documentation\":\"<p>The output from the ListThings operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists your things. Use the <b>attributeName</b> and <b>attributeValue</b> parameters to filter your things. For example, calling <code>ListThings</code> with attributeName=Color and attributeValue=Red retrieves all things in the registry that contain an attribute <b>Color</b> with the value <b>Red</b>. </p>\"\
    },\
    \"ListTopicRules\":{\
      \"name\":\"ListTopicRules\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/rules\"\
      },\
      \"input\":{\
        \"shape\":\"ListTopicRulesRequest\",\
        \"documentation\":\"<p>The input for the ListTopicRules operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"ListTopicRulesResponse\",\
        \"documentation\":\"<p>The output from the ListTopicRules operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Lists the rules for the specific topic.</p>\"\
    },\
    \"RegisterCACertificate\":{\
      \"name\":\"RegisterCACertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/cacertificate\"\
      },\
      \"input\":{\
        \"shape\":\"RegisterCACertificateRequest\",\
        \"documentation\":\"<p>The input to the RegisterCACertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"RegisterCACertificateResponse\",\
        \"documentation\":\"<p>The output from the RegisterCACertificateResponse operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceAlreadyExistsException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The resource already exists.</p>\"\
        },\
        {\
          \"shape\":\"RegistrationCodeValidationException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The registration code is invalid.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"CertificateValidationException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate is invalid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"LimitExceededException\",\
          \"error\":{\"httpStatusCode\":410},\
          \"exception\":true,\
          \"documentation\":\"<p>The number of attached entities exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Registers a CA certificate with AWS IoT. This CA certificate can then be used to sign device certificates, which can be then registered with AWS IoT. You can register up to 10 CA certificates per AWS account that have the same subject field and public key. This enables you to have up to 10 certificate authorities sign your device certificates. If you have more than one CA certificate registered, make sure you pass the CA certificate when you register your device certificates with the RegisterCertificate API.</p>\"\
    },\
    \"RegisterCertificate\":{\
      \"name\":\"RegisterCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/certificate/register\"\
      },\
      \"input\":{\
        \"shape\":\"RegisterCertificateRequest\",\
        \"documentation\":\"<p>The input to the RegisterCertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"RegisterCertificateResponse\",\
        \"documentation\":\"<p>The output from the RegisterCertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceAlreadyExistsException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>The resource already exists.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"CertificateValidationException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate is invalid.</p>\"\
        },\
        {\
          \"shape\":\"CertificateStateException\",\
          \"error\":{\"httpStatusCode\":406},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\"\
        },\
        {\
          \"shape\":\"CertificateConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>Unable to verify the CA certificate used to sign the device certificate you are attempting to register. This is happens when you have registered more than one CA certificate that has the same subject field and public key.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Registers a device certificate with AWS IoT. If you have more than one CA certificate that has the same subject field, you must specify the CA certificate that was used to sign the device certificate being registered.</p>\"\
    },\
    \"RejectCertificateTransfer\":{\
      \"name\":\"RejectCertificateTransfer\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/reject-certificate-transfer/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"RejectCertificateTransferRequest\",\
        \"documentation\":\"<p>The input for the RejectCertificateTransfer operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"TransferAlreadyCompletedException\",\
          \"error\":{\"httpStatusCode\":410},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't revert the certificate transfer because the transfer is already complete.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Rejects a pending certificate transfer. After AWS IoT rejects a certificate transfer, the certificate status changes from <b>PENDING_TRANSFER</b> to <b>INACTIVE</b>.</p> <p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p> <p>This operation can only be called by the transfer destination. After it is called, the certificate will be returned to the source's account in the INACTIVE state.</p>\"\
    },\
    \"ReplaceTopicRule\":{\
      \"name\":\"ReplaceTopicRule\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/rules/{ruleName}\"\
      },\
      \"input\":{\
        \"shape\":\"ReplaceTopicRuleRequest\",\
        \"documentation\":\"<p>The input for the ReplaceTopicRule operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"SqlParseException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\"\
        },\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Replaces the specified rule. You must specify all parameters for the new rule. Creating rules is an administrator-level action. Any user who has permission to create rules will be able to access data processed by the rule.</p>\"\
    },\
    \"SetDefaultPolicyVersion\":{\
      \"name\":\"SetDefaultPolicyVersion\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\"\
      },\
      \"input\":{\
        \"shape\":\"SetDefaultPolicyVersionRequest\",\
        \"documentation\":\"<p>The input for the SetDefaultPolicyVersion operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Sets the specified version of the specified policy as the policy's default (operative) version. This action affects all certificates to which the policy is attached. To list the principals the policy is attached to, use the ListPrincipalPolicy API.</p>\"\
    },\
    \"SetLoggingOptions\":{\
      \"name\":\"SetLoggingOptions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/loggingOptions\"\
      },\
      \"input\":{\
        \"shape\":\"SetLoggingOptionsRequest\",\
        \"documentation\":\"<p>The input for the SetLoggingOptions operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InternalException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Sets the logging options.</p>\"\
    },\
    \"TransferCertificate\":{\
      \"name\":\"TransferCertificate\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/transfer-certificate/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"TransferCertificateRequest\",\
        \"documentation\":\"<p>The input for the TransferCertificate operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"TransferCertificateResponse\",\
        \"documentation\":\"<p>The output from the TransferCertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"CertificateStateException\",\
          \"error\":{\"httpStatusCode\":406},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\"\
        },\
        {\
          \"shape\":\"TransferConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>You can't transfer the certificate because authorization policies are still attached.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Transfers the specified certificate to the specified AWS account.</p> <p>You can cancel the transfer until it is acknowledged by the recipient.</p> <p>No notification is sent to the transfer destination's account. It is up to the caller to notify the transfer target.</p> <p>The certificate being transferred must not be in the ACTIVE state. You can use the UpdateCertificate API to deactivate it.</p> <p>The certificate must not have any policies attached to it. You can use the DetachPrincipalPolicy API to detach them.</p>\"\
    },\
    \"UpdateCACertificate\":{\
      \"name\":\"UpdateCACertificate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/cacertificate/{caCertificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateCACertificateRequest\",\
        \"documentation\":\"<p>The input to the UpdateCACertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Updates a registered CA certificate.</p>\"\
    },\
    \"UpdateCertificate\":{\
      \"name\":\"UpdateCertificate\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/certificates/{certificateId}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateCertificateRequest\",\
        \"documentation\":\"<p>The input for the UpdateCertificate operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        },\
        {\
          \"shape\":\"CertificateStateException\",\
          \"error\":{\"httpStatusCode\":406},\
          \"exception\":true,\
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\"\
        },\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Updates the status of the specified certificate. This operation is idempotent.</p> <p>Moving a certificate from the ACTIVE state (including REVOKED) will not disconnect currently connected devices, but these devices will be unable to reconnect.</p> <p>The ACTIVE state is required to authenticate devices connecting to AWS IoT using a certificate.</p>\"\
    },\
    \"UpdateThing\":{\
      \"name\":\"UpdateThing\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/things/{thingName}\"\
      },\
      \"input\":{\
        \"shape\":\"UpdateThingRequest\",\
        \"documentation\":\"<p>The input for the UpdateThing operation.</p>\"\
      },\
      \"output\":{\
        \"shape\":\"UpdateThingResponse\",\
        \"documentation\":\"<p>The output from the UpdateThing operation.</p>\"\
      },\
      \"errors\":[\
        {\
          \"shape\":\"InvalidRequestException\",\
          \"error\":{\"httpStatusCode\":400},\
          \"exception\":true,\
          \"documentation\":\"<p>The request is not valid.</p>\"\
        },\
        {\
          \"shape\":\"VersionConflictException\",\
          \"error\":{\"httpStatusCode\":409},\
          \"exception\":true,\
          \"documentation\":\"<p>An exception thrown when the version of a thing passed to a command is different than the version specified with the --version parameter. </p>\"\
        },\
        {\
          \"shape\":\"ThrottlingException\",\
          \"error\":{\"httpStatusCode\":429},\
          \"exception\":true,\
          \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
        },\
        {\
          \"shape\":\"UnauthorizedException\",\
          \"error\":{\"httpStatusCode\":401},\
          \"exception\":true,\
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
        },\
        {\
          \"shape\":\"ServiceUnavailableException\",\
          \"error\":{\"httpStatusCode\":503},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
        },\
        {\
          \"shape\":\"InternalFailureException\",\
          \"error\":{\"httpStatusCode\":500},\
          \"exception\":true,\
          \"fault\":true,\
          \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
        },\
        {\
          \"shape\":\"ResourceNotFoundException\",\
          \"error\":{\"httpStatusCode\":404},\
          \"exception\":true,\
          \"documentation\":\"<p>The specified resource does not exist.</p>\"\
        }\
      ],\
      \"documentation\":\"<p>Updates the data for a thing.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AcceptCertificateTransferRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\",\
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the AcceptCertificateTransfer operation.</p>\"\
    },\
    \"Action\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"dynamoDB\":{\
          \"shape\":\"DynamoDBAction\",\
          \"documentation\":\"<p>Write to a DynamoDB table.</p>\"\
        },\
        \"dynamoDBv2\":{\
          \"shape\":\"DynamoDBv2Action\",\
          \"documentation\":\"<p>Write to a DynamoDB table. This is a new version of the DynamoDB action. It allows you to write each attribute in an MQTT message payload into a separate DynamoDB column.</p>\"\
        },\
        \"lambda\":{\
          \"shape\":\"LambdaAction\",\
          \"documentation\":\"<p>Invoke a Lambda function.</p>\"\
        },\
        \"sns\":{\
          \"shape\":\"SnsAction\",\
          \"documentation\":\"<p>Publish to an Amazon SNS topic.</p>\"\
        },\
        \"sqs\":{\
          \"shape\":\"SqsAction\",\
          \"documentation\":\"<p>Publish to an Amazon SQS queue.</p>\"\
        },\
        \"kinesis\":{\
          \"shape\":\"KinesisAction\",\
          \"documentation\":\"<p>Write data to an Amazon Kinesis stream.</p>\"\
        },\
        \"republish\":{\
          \"shape\":\"RepublishAction\",\
          \"documentation\":\"<p>Publish to another MQTT topic.</p>\"\
        },\
        \"s3\":{\
          \"shape\":\"S3Action\",\
          \"documentation\":\"<p>Write to an Amazon S3 bucket.</p>\"\
        },\
        \"firehose\":{\
          \"shape\":\"FirehoseAction\",\
          \"documentation\":\"<p>Write to an Amazon Kinesis Firehose stream.</p>\"\
        },\
        \"cloudwatchMetric\":{\
          \"shape\":\"CloudwatchMetricAction\",\
          \"documentation\":\"<p>Capture a CloudWatch metric.</p>\"\
        },\
        \"cloudwatchAlarm\":{\
          \"shape\":\"CloudwatchAlarmAction\",\
          \"documentation\":\"<p>Change the state of a CloudWatch alarm.</p>\"\
        },\
        \"elasticsearch\":{\
          \"shape\":\"ElasticsearchAction\",\
          \"documentation\":\"<p>Write data to an Amazon Elasticsearch Service domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the actions associated with a rule.</p>\"\
    },\
    \"ActionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Action\"},\
      \"min\":0,\
      \"max\":10\
    },\
    \"AlarmName\":{\"type\":\"string\"},\
    \"AllowAutoRegistration\":{\"type\":\"boolean\"},\
    \"AscendingOrder\":{\"type\":\"boolean\"},\
    \"AttachPrincipalPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-principal\",\
          \"documentation\":\"<p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the AttachPrincipalPolicy operation.</p>\"\
    },\
    \"AttachThingPrincipalRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-principal\",\
          \"documentation\":\"<p>The principal, such as a certificate or other credential.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the AttachThingPrincipal operation.</p>\"\
    },\
    \"AttachThingPrincipalResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output from the AttachThingPrincipal operation.</p>\"\
    },\
    \"AttributeName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[a-zA-Z0-9_.,@/:#-]+\"\
    },\
    \"AttributePayload\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A JSON string containing up to three key-value pair in JSON format. For example:</p> <p><code>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}})</code></p>\"\
        },\
        \"merge\":{\
          \"shape\":\"Flag\",\
          \"documentation\":\"<p>Specifies whether the list of attributes provided in the <code>AttributePayload</code> is merged with the attributes stored in the registry, instead of overwriting them.</p> <p>To remove an attribute, call <code>UpdateThing</code> with an empty attribute value.</p> <note> <p>The <code>merge</code> attribute is only valid when calling <code>UpdateThing</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The attribute payload.</p>\"\
    },\
    \"AttributeValue\":{\
      \"type\":\"string\",\
      \"max\":800,\
      \"pattern\":\"[a-zA-Z0-9_.,@/:#-]*\",\
      \"documentation\":\"An attribute value for an Thing. An empty or null value in Update means that existing value for that attribute should be deleted. Empty and null values in create are ignored.\"\
    },\
    \"Attributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeName\"},\
      \"value\":{\"shape\":\"AttributeValue\"}\
    },\
    \"AutoRegistrationStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLE\",\
        \"DISABLE\"\
      ]\
    },\
    \"AwsAccountId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9]{12}\"\
    },\
    \"AwsArn\":{\"type\":\"string\"},\
    \"AwsIotSqlVersion\":{\"type\":\"string\"},\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BucketName\":{\"type\":\"string\"},\
    \"CACertificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the CA certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the CA certificate.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CACertificateStatus\",\
          \"documentation\":\"<p>The status of the CA certificate. </p> <p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the CA certificate was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A CA certificate.</p>\"\
    },\
    \"CACertificateDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The CA certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The CA certificate ID.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CACertificateStatus\",\
          \"documentation\":\"<p>The status of a CA certificate.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The CA certificate data, in PEM format.</p>\"\
        },\
        \"ownedBy\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The owner of the CA certificate.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the CA certificate was created.</p>\"\
        },\
        \"autoRegistrationStatus\":{\
          \"shape\":\"AutoRegistrationStatus\",\
          \"documentation\":\"<p>Whether the CA certificate configured for auto registration of device certificates. Valid values are \\\"ENABLE\\\" and \\\"DISABLE\\\"</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a CA certificate.</p>\"\
    },\
    \"CACertificateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"CACertificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CACertificate\"}\
    },\
    \"CancelCertificateTransferRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CancelCertificateTransfer operation.</p>\"\
    },\
    \"CannedAccessControlList\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"private\",\
        \"public-read\",\
        \"public-read-write\",\
        \"aws-exec-read\",\
        \"authenticated-read\",\
        \"bucket-owner-read\",\
        \"bucket-owner-full-control\",\
        \"log-delivery-write\"\
      ]\
    },\
    \"Certificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The status of the certificate.</p> <p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the certificate was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a certificate.</p>\"\
    },\
    \"CertificateArn\":{\"type\":\"string\"},\
    \"CertificateConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true,\
      \"documentation\":\"<p>Unable to verify the CA certificate used to sign the device certificate you are attempting to register. This is happens when you have registered more than one CA certificate that has the same subject field and public key.</p>\"\
    },\
    \"CertificateDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"caCertificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The certificate ID of the CA certificate used to sign this certificate.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"CertificateStatus\",\
          \"documentation\":\"<p>The status of the certificate.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"ownedBy\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account that owns the certificate.</p>\"\
        },\
        \"previousOwnedBy\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The ID of the AWS account of the previous owner of the certificate.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the certificate was created.</p>\"\
        },\
        \"lastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the certificate was last modified.</p>\"\
        },\
        \"transferData\":{\
          \"shape\":\"TransferData\",\
          \"documentation\":\"<p>The transfer data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a certificate.</p>\"\
    },\
    \"CertificateId\":{\
      \"type\":\"string\",\
      \"min\":64,\
      \"max\":64,\
      \"pattern\":\"(0x)?[a-fA-F0-9]+\"\
    },\
    \"CertificatePem\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":65536\
    },\
    \"CertificateSigningRequest\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"CertificateStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":406},\
      \"exception\":true,\
      \"documentation\":\"<p>The certificate operation is not allowed.</p>\"\
    },\
    \"CertificateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\",\
        \"REVOKED\",\
        \"PENDING_TRANSFER\",\
        \"REGISTER_INACTIVE\",\
        \"PENDING_ACTIVATION\"\
      ]\
    },\
    \"CertificateValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>Additional information about the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true,\
      \"documentation\":\"<p>The certificate is invalid.</p>\"\
    },\
    \"Certificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Certificate\"}\
    },\
    \"ClientId\":{\"type\":\"string\"},\
    \"CloudwatchAlarmAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"alarmName\",\
        \"stateReason\",\
        \"stateValue\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that allows access to the CloudWatch alarm.</p>\"\
        },\
        \"alarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The CloudWatch alarm name.</p>\"\
        },\
        \"stateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>The reason for the alarm change.</p>\"\
        },\
        \"stateValue\":{\
          \"shape\":\"StateValue\",\
          \"documentation\":\"<p>The value of the alarm state. Acceptable values are: OK, ALARM, INSUFFICIENT_DATA.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that updates a CloudWatch alarm.</p>\"\
    },\
    \"CloudwatchMetricAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"metricNamespace\",\
        \"metricName\",\
        \"metricValue\",\
        \"metricUnit\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that allows access to the CloudWatch metric.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>The CloudWatch metric namespace name.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The CloudWatch metric name.</p>\"\
        },\
        \"metricValue\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The CloudWatch metric value.</p>\"\
        },\
        \"metricUnit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit\\\">metric unit</a> supported by CloudWatch.</p>\"\
        },\
        \"metricTimestamp\":{\
          \"shape\":\"MetricTimestamp\",\
          \"documentation\":\"<p>An optional <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp\\\">Unix timestamp</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that captures a CloudWatch metric.</p>\"\
    },\
    \"CreateCertificateFromCsrRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateSigningRequest\"],\
      \"members\":{\
        \"certificateSigningRequest\":{\
          \"shape\":\"CertificateSigningRequest\",\
          \"documentation\":\"<p>The certificate signing request (CSR).</p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\",\
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateCertificateFromCsr operation.</p>\"\
    },\
    \"CreateCertificateFromCsrResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy operations.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. Certificate management operations only take a certificateId.</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the CreateCertificateFromCsr operation.</p>\"\
    },\
    \"CreateKeysAndCertificateRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\",\
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateKeysAndCertificate operation.</p>\"\
    },\
    \"CreateKeysAndCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The ID of the certificate. AWS IoT issues a default subject name for the certificate (for example, AWS IoT Certificate).</p>\"\
        },\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"keyPair\":{\
          \"shape\":\"KeyPair\",\
          \"documentation\":\"<p>The generated key pair.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreateKeysAndCertificate operation.</p>\"\
    },\
    \"CreatePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyDocument\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy. <b>policyDocument</b> must have a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreatePolicy operation.</p>\"\
    },\
    \"CreatePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the CreatePolicy operation.</p>\"\
    },\
    \"CreatePolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyDocument\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding whitespaces</p>\"\
        },\
        \"setAsDefault\":{\
          \"shape\":\"SetAsDefault\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsDefault\",\
          \"documentation\":\"<p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreatePolicyVersion operation.</p>\"\
    },\
    \"CreatePolicyVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreatePolicyVersion operation.</p>\"\
    },\
    \"CreateThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing to create.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type associated with the new thing.</p>\"\
        },\
        \"attributePayload\":{\
          \"shape\":\"AttributePayload\",\
          \"documentation\":\"<p>The attribute payload, which consists of up to three name/value pairs in a JSON document. For example:</p> <p><code>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}})</code></p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateThing operation.</p>\"\
    },\
    \"CreateThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the new thing.</p>\"\
        },\
        \"thingArn\":{\
          \"shape\":\"ThingArn\",\
          \"documentation\":\"<p>The ARN of the new thing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreateThing operation.</p>\"\
    },\
    \"CreateThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeProperties\":{\
          \"shape\":\"ThingTypeProperties\",\
          \"documentation\":\"<p>The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateThingType operation.</p>\"\
    },\
    \"CreateThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeArn\":{\
          \"shape\":\"ThingTypeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the thing type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the CreateThingType operation.</p>\"\
    },\
    \"CreateTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ruleName\",\
        \"topicRulePayload\"\
      ],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"topicRulePayload\":{\
          \"shape\":\"TopicRulePayload\",\
          \"documentation\":\"<p>The rule payload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the CreateTopicRule operation.</p>\",\
      \"payload\":\"topicRulePayload\"\
    },\
    \"CreatedAtDate\":{\"type\":\"timestamp\"},\
    \"CreationDate\":{\"type\":\"timestamp\"},\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DeleteCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\",\
          \"documentation\":\"<p>The ID of the certificate to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for the DeleteCACertificate operation.</p>\"\
    },\
    \"DeleteCACertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeleteCACertificate operation.</p>\"\
    },\
    \"DeleteCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteCertificate operation.</p>\"\
    },\
    \"DeleteConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true,\
      \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\"\
    },\
    \"DeletePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The name of the policy to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeletePolicy operation.</p>\"\
    },\
    \"DeletePolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyVersionId\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeletePolicyVersion operation.</p>\"\
    },\
    \"DeleteRegistrationCodeRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input for the DeleteRegistrationCode operation.</p>\"\
    },\
    \"DeleteRegistrationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeleteRegistrationCode operation. </p>\"\
    },\
    \"DeleteThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing to delete.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"location\":\"querystring\",\
          \"locationName\":\"expectedVersion\",\
          \"documentation\":\"<p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>DeleteThing</code> request is rejected with a <code>VersionConflictException</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteThing operation.</p>\"\
    },\
    \"DeleteThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output of the DeleteThing operation.</p>\"\
    },\
    \"DeleteThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteThingType operation.</p>\"\
    },\
    \"DeleteThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeleteThingType operation.</p>\"\
    },\
    \"DeleteTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteTopicRule operation.</p>\",\
      \"required\":[\"ruleName\"]\
    },\
    \"DeliveryStreamName\":{\"type\":\"string\"},\
    \"DeprecateThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\",\
          \"documentation\":\"<p>The name of the thing type to deprecate.</p>\"\
        },\
        \"undoDeprecate\":{\
          \"shape\":\"UndoDeprecate\",\
          \"documentation\":\"<p>Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing type will not be deprecated anymore and you can associate it with things.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeprecateThingType operation.</p>\"\
    },\
    \"DeprecateThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output for the DeprecateThingType operation.</p>\"\
    },\
    \"DeprecationDate\":{\"type\":\"timestamp\"},\
    \"DescribeCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\",\
          \"documentation\":\"<p>The CA certificate identifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeCACertificate operation.</p>\"\
    },\
    \"DescribeCACertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateDescription\":{\
          \"shape\":\"CACertificateDescription\",\
          \"documentation\":\"<p>The CA certificate description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DescribeCACertificate operation.</p>\"\
    },\
    \"DescribeCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeCertificate operation.</p>\"\
    },\
    \"DescribeCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateDescription\":{\
          \"shape\":\"CertificateDescription\",\
          \"documentation\":\"<p>The description of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the DescribeCertificate operation.</p>\"\
    },\
    \"DescribeEndpointRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input for the DescribeEndpoint operation.</p>\"\
    },\
    \"DescribeEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"endpointAddress\":{\
          \"shape\":\"EndpointAddress\",\
          \"documentation\":\"<p>The endpoint. The format of the endpoint is as follows: <i>identifier</i>.iot.<i>region</i>.amazonaws.com.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DescribeEndpoint operation.</p>\"\
    },\
    \"DescribeThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeThing operation.</p>\"\
    },\
    \"DescribeThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"defaultClientId\":{\
          \"shape\":\"ClientId\",\
          \"documentation\":\"<p>The default client ID.</p>\"\
        },\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The thing type name.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>The thing attributes.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The current version of the thing record in the registry.</p> <note> <p>To avoid unintentional changes to the information in the registry, you can pass the version information in the <code>expectedVersion</code> parameter of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DescribeThing operation.</p>\"\
    },\
    \"DescribeThingTypeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingTypeName\"],\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DescribeThingType operation.</p>\"\
    },\
    \"DescribeThingTypeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeProperties\":{\
          \"shape\":\"ThingTypeProperties\",\
          \"documentation\":\"<p>The ThingTypeProperties contains information about the thing type including description, and a list of searchable thing attribute names.</p>\"\
        },\
        \"thingTypeMetadata\":{\"shape\":\"ThingTypeMetadata\"}\
      },\
      \"documentation\":\"<p>The output for the DescribeThingType operation.</p>\"\
    },\
    \"Description\":{\"type\":\"string\"},\
    \"DetachPrincipalPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The name of the policy to detach.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-principal\",\
          \"documentation\":\"<p>The principal.</p> <p>If the principal is a certificate, specify the certificate ARN. If the principal is an Amazon Cognito identity, specify the identity ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DetachPrincipalPolicy operation.</p>\"\
    },\
    \"DetachThingPrincipalRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"principal\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-principal\",\
          \"documentation\":\"<p>If the principal is a certificate, this value must be ARN of the certificate. If the principal is an Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DetachThingPrincipal operation.</p>\"\
    },\
    \"DetachThingPrincipalResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output from the DetachThingPrincipal operation.</p>\"\
    },\
    \"DisableTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\",\
          \"documentation\":\"<p>The name of the rule to disable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DisableTopicRuleRequest operation.</p>\"\
    },\
    \"DynamoDBAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"tableName\",\
        \"roleArn\",\
        \"hashKeyField\",\
        \"hashKeyValue\"\
      ],\
      \"members\":{\
        \"tableName\":{\
          \"shape\":\"TableName\",\
          \"documentation\":\"<p>The name of the DynamoDB table.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access to the DynamoDB table.</p>\"\
        },\
        \"operation\":{\
          \"shape\":\"DynamoOperation\",\
          \"documentation\":\"<p>The type of operation to be performed. This follows the substitution template, so it can be <code>${operation}</code>, but the substitution must result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or <code>DELETE</code>.</p>\"\
        },\
        \"hashKeyField\":{\
          \"shape\":\"HashKeyField\",\
          \"documentation\":\"<p>The hash key name.</p>\"\
        },\
        \"hashKeyValue\":{\
          \"shape\":\"HashKeyValue\",\
          \"documentation\":\"<p>The hash key value.</p>\"\
        },\
        \"hashKeyType\":{\
          \"shape\":\"DynamoKeyType\",\
          \"documentation\":\"<p>The hash key type. Valid values are \\\"STRING\\\" or \\\"NUMBER\\\"</p>\"\
        },\
        \"rangeKeyField\":{\
          \"shape\":\"RangeKeyField\",\
          \"documentation\":\"<p>The range key name.</p>\"\
        },\
        \"rangeKeyValue\":{\
          \"shape\":\"RangeKeyValue\",\
          \"documentation\":\"<p>The range key value.</p>\"\
        },\
        \"rangeKeyType\":{\
          \"shape\":\"DynamoKeyType\",\
          \"documentation\":\"<p>The range key type. Valid values are \\\"STRING\\\" or \\\"NUMBER\\\"</p>\"\
        },\
        \"payloadField\":{\
          \"shape\":\"PayloadField\",\
          \"documentation\":\"<p>The action payload. This name can be customized.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write to a DynamoDB table.</p> <p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p> <p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p> <p>You can specify any valid expression in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p> <p><code>\\\"hashKeyValue\\\": \\\"${topic(3)}\\\"</code></p> <p>The following field uses the timestamp:</p> <p><code>\\\"rangeKeyValue\\\": \\\"${timestamp()}\\\"</code></p>\"\
    },\
    \"DynamoDBv2Action\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access to the DynamoDB table.</p>\"\
        },\
        \"putItem\":{\
          \"shape\":\"PutItemInput\",\
          \"documentation\":\"<p>Specifies the DynamoDB table to which the message data will be written. For example:</p> <p><code>{ \\\"dynamoDBv2\\\": { \\\"roleArn\\\": \\\"aws:iam:12341251:my-role\\\" \\\"putItem\\\": { \\\"tableName\\\": \\\"my-table\\\" } } }</code></p> <p>Each attribute in the message payload will be written to a separate column in the DynamoDB database.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write to a DynamoDB table.</p> <p>This DynamoDB action writes each attribute in the message payload into it's own column in the DynamoDB table.</p>\"\
    },\
    \"DynamoKeyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STRING\",\
        \"NUMBER\"\
      ]\
    },\
    \"DynamoOperation\":{\"type\":\"string\"},\
    \"ElasticsearchAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"endpoint\",\
        \"index\",\
        \"type\",\
        \"id\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role ARN that has access to Elasticsearch.</p>\"\
        },\
        \"endpoint\":{\
          \"shape\":\"ElasticsearchEndpoint\",\
          \"documentation\":\"<p>The endpoint of your Elasticsearch domain.</p>\"\
        },\
        \"index\":{\
          \"shape\":\"ElasticsearchIndex\",\
          \"documentation\":\"<p>The Elasticsearch index where you want to store your data.</p>\"\
        },\
        \"type\":{\
          \"shape\":\"ElasticsearchType\",\
          \"documentation\":\"<p>The type of document you are storing.</p>\"\
        },\
        \"id\":{\
          \"shape\":\"ElasticsearchId\",\
          \"documentation\":\"<p>The unique identifier for the document you are storing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that writes data to an Amazon Elasticsearch Service domain.</p>\"\
    },\
    \"ElasticsearchEndpoint\":{\
      \"type\":\"string\",\
      \"pattern\":\"https?://.*\"\
    },\
    \"ElasticsearchId\":{\"type\":\"string\"},\
    \"ElasticsearchIndex\":{\"type\":\"string\"},\
    \"ElasticsearchType\":{\"type\":\"string\"},\
    \"EnableTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\",\
          \"documentation\":\"<p>The name of the topic rule to enable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the EnableTopicRuleRequest operation.</p>\"\
    },\
    \"EndpointAddress\":{\"type\":\"string\"},\
    \"FirehoseAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"deliveryStreamName\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The IAM role that grants access to the Amazon Kinesis Firehost stream.</p>\"\
        },\
        \"deliveryStreamName\":{\
          \"shape\":\"DeliveryStreamName\",\
          \"documentation\":\"<p>The delivery stream name.</p>\"\
        },\
        \"separator\":{\
          \"shape\":\"FirehoseSeparator\",\
          \"documentation\":\"<p>A character separator that will be used to separate records written to the Firehose stream. Valid values are: '\\\\n' (newline), '\\\\t' (tab), '\\\\r\\\\n' (Windows newline), ',' (comma).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action that writes data to an Amazon Kinesis Firehose stream.</p>\"\
    },\
    \"FirehoseSeparator\":{\
      \"type\":\"string\",\
      \"pattern\":\"([\\\\n\\\\t])|(\\\\r\\\\n)|(,)\"\
    },\
    \"Flag\":{\"type\":\"boolean\"},\
    \"FunctionArn\":{\"type\":\"string\"},\
    \"GetLoggingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input for the GetLoggingOptions operation.</p>\"\
    },\
    \"GetLoggingOptionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The logging level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetLoggingOptions operation.</p>\"\
    },\
    \"GetPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetPolicy operation.</p>\"\
    },\
    \"GetPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"defaultVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The default policy version ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetPolicy operation.</p>\"\
    },\
    \"GetPolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyVersionId\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetPolicyVersion operation.</p>\"\
    },\
    \"GetPolicyVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        },\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetPolicyVersion operation.</p>\"\
    },\
    \"GetRegistrationCodeRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input to the GetRegistrationCode operation.</p>\"\
    },\
    \"GetRegistrationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"registrationCode\":{\
          \"shape\":\"RegistrationCode\",\
          \"documentation\":\"<p>The CA certificate registration code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetRegistrationCode operation.</p>\"\
    },\
    \"GetTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ruleName\"],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetTopicRule operation.</p>\"\
    },\
    \"GetTopicRuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The rule ARN.</p>\"\
        },\
        \"rule\":{\
          \"shape\":\"TopicRule\",\
          \"documentation\":\"<p>The rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetTopicRule operation.</p>\"\
    },\
    \"HashKeyField\":{\"type\":\"string\"},\
    \"HashKeyValue\":{\"type\":\"string\"},\
    \"InternalException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true,\
      \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true,\
      \"documentation\":\"<p>An unexpected error has occurred.</p>\"\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true,\
      \"documentation\":\"<p>The request is not valid.</p>\"\
    },\
    \"IsDefaultVersion\":{\"type\":\"boolean\"},\
    \"IsDisabled\":{\"type\":\"boolean\"},\
    \"Key\":{\"type\":\"string\"},\
    \"KeyPair\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PublicKey\":{\
          \"shape\":\"PublicKey\",\
          \"documentation\":\"<p>The public key.</p>\"\
        },\
        \"PrivateKey\":{\
          \"shape\":\"PrivateKey\",\
          \"documentation\":\"<p>The private key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key pair.</p>\"\
    },\
    \"KinesisAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"streamName\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access to the Amazon Kinesis stream.</p>\"\
        },\
        \"streamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the Amazon Kinesis stream.</p>\"\
        },\
        \"partitionKey\":{\
          \"shape\":\"PartitionKey\",\
          \"documentation\":\"<p>The partition key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write data to an Amazon Kinesis stream.</p>\"\
    },\
    \"LambdaAction\":{\
      \"type\":\"structure\",\
      \"required\":[\"functionArn\"],\
      \"members\":{\
        \"functionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN of the Lambda function.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to invoke a Lambda function.</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true,\
      \"documentation\":\"<p>The number of attached entities exceeds the limit.</p>\"\
    },\
    \"ListCACertificatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Determines the order of the results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input for the ListCACertificates operation.</p>\"\
    },\
    \"ListCACertificatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificates\":{\
          \"shape\":\"CACertificates\",\
          \"documentation\":\"<p>The CA certificates registered in your AWS account.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The current position within the list of CA certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListCACertificates operation.</p>\"\
    },\
    \"ListCertificatesByCARequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"caCertificateId\"],\
      \"members\":{\
        \"caCertificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\",\
          \"documentation\":\"<p>The ID of the CA certificate. This operation will list all registered device certificate that were signed by this CA certificate. </p>\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the ListCertificatesByCA operation.</p>\"\
    },\
    \"ListCertificatesByCAResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificates\":{\
          \"shape\":\"Certificates\",\
          \"documentation\":\"<p>The device certificates signed by the specified CA certificate.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the ListCertificatesByCA operation.</p>\"\
    },\
    \"ListCertificatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListCertificates operation.</p>\"\
    },\
    \"ListCertificatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificates\":{\
          \"shape\":\"Certificates\",\
          \"documentation\":\"<p>The descriptions of the certificates.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output of the ListCertificates operation.</p>\"\
    },\
    \"ListOutgoingCertificatesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the ListOutgoingCertificates operation.</p>\"\
    },\
    \"ListOutgoingCertificatesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"outgoingCertificates\":{\
          \"shape\":\"OutgoingCertificates\",\
          \"documentation\":\"<p>The certificates that are being transfered but not yet accepted.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListOutgoingCertificates operation.</p>\"\
    },\
    \"ListPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPolicies operation.</p>\"\
    },\
    \"ListPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The descriptions of the policies.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPolicies operation.</p>\"\
    },\
    \"ListPolicyPrincipalsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-policy\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPolicyPrincipals operation.</p>\"\
    },\
    \"ListPolicyPrincipalsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"principals\":{\
          \"shape\":\"Principals\",\
          \"documentation\":\"<p>The descriptions of the principals.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPolicyPrincipals operation.</p>\"\
    },\
    \"ListPolicyVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyName\"],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPolicyVersions operation.</p>\"\
    },\
    \"ListPolicyVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyVersions\":{\
          \"shape\":\"PolicyVersions\",\
          \"documentation\":\"<p>The policy versions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPolicyVersions operation.</p>\"\
    },\
    \"ListPrincipalPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"principal\"],\
      \"members\":{\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-iot-principal\",\
          \"documentation\":\"<p>The principal.</p>\"\
        },\
        \"marker\":{\
          \"shape\":\"Marker\",\
          \"location\":\"querystring\",\
          \"locationName\":\"marker\",\
          \"documentation\":\"<p>The marker for the next set of results.</p>\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\",\
          \"documentation\":\"<p>The result page size.</p>\"\
        },\
        \"ascendingOrder\":{\
          \"shape\":\"AscendingOrder\",\
          \"location\":\"querystring\",\
          \"locationName\":\"isAscendingOrder\",\
          \"documentation\":\"<p>Specifies the order for results. If true, results are returned in ascending creation order.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPrincipalPolicies operation.</p>\"\
    },\
    \"ListPrincipalPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policies\":{\
          \"shape\":\"Policies\",\
          \"documentation\":\"<p>The policies.</p>\"\
        },\
        \"nextMarker\":{\
          \"shape\":\"Marker\",\
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPrincipalPolicies operation.</p>\"\
    },\
    \"ListPrincipalThingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"principal\"],\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\"\
        },\
        \"principal\":{\
          \"shape\":\"Principal\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amzn-principal\",\
          \"documentation\":\"<p>The principal.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListPrincipalThings operation.</p>\"\
    },\
    \"ListPrincipalThingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"things\":{\
          \"shape\":\"ThingNameList\",\
          \"documentation\":\"<p>The things.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListPrincipalThings operation.</p>\"\
    },\
    \"ListThingPrincipalsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListThingPrincipal operation.</p>\"\
    },\
    \"ListThingPrincipalsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"principals\":{\
          \"shape\":\"Principals\",\
          \"documentation\":\"<p>The principals associated with the thing.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListThingPrincipals operation.</p>\"\
    },\
    \"ListThingTypesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListThingTypes operation.</p>\"\
    },\
    \"ListThingTypesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypes\":{\
          \"shape\":\"ThingTypeList\",\
          \"documentation\":\"<p>The thing types.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output for the ListThingTypes operation.</p>\"\
    },\
    \"ListThingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in this operation.</p>\"\
        },\
        \"attributeName\":{\
          \"shape\":\"AttributeName\",\
          \"location\":\"querystring\",\
          \"locationName\":\"attributeName\",\
          \"documentation\":\"<p>The attribute name used to search for things.</p>\"\
        },\
        \"attributeValue\":{\
          \"shape\":\"AttributeValue\",\
          \"location\":\"querystring\",\
          \"locationName\":\"attributeValue\",\
          \"documentation\":\"<p>The attribute value used to search for things.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"location\":\"querystring\",\
          \"locationName\":\"thingTypeName\",\
          \"documentation\":\"<p>The name of the thing type used to search for things.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListThings operation.</p>\"\
    },\
    \"ListThingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"things\":{\
          \"shape\":\"ThingAttributeList\",\
          \"documentation\":\"<p>The things.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListThings operation.</p>\"\
    },\
    \"ListTopicRulesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"location\":\"querystring\",\
          \"locationName\":\"topic\",\
          \"documentation\":\"<p>The topic.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\",\
          \"documentation\":\"<p>The maximum number of results to return.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\",\
          \"documentation\":\"<p>A token used to retrieve the next value.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"location\":\"querystring\",\
          \"locationName\":\"ruleDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ListTopicRules operation.</p>\"\
    },\
    \"ListTopicRulesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"rules\":{\
          \"shape\":\"TopicRuleList\",\
          \"documentation\":\"<p>The rules.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token used to retrieve the next value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the ListTopicRules operation.</p>\"\
    },\
    \"LogLevel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEBUG\",\
        \"INFO\",\
        \"ERROR\",\
        \"WARN\",\
        \"DISABLED\"\
      ]\
    },\
    \"LoggingOptionsPayload\":{\
      \"type\":\"structure\",\
      \"required\":[\"roleArn\"],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"logLevel\":{\
          \"shape\":\"LogLevel\",\
          \"documentation\":\"<p>The logging level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the logging options payload.</p>\"\
    },\
    \"MalformedPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true,\
      \"documentation\":\"<p>The policy documentation is not valid.</p>\"\
    },\
    \"Marker\":{\"type\":\"string\"},\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"min\":1,\
      \"max\":10000\
    },\
    \"Message\":{\
      \"type\":\"string\",\
      \"max\":128\
    },\
    \"MessageFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RAW\",\
        \"JSON\"\
      ]\
    },\
    \"MetricName\":{\"type\":\"string\"},\
    \"MetricNamespace\":{\"type\":\"string\"},\
    \"MetricTimestamp\":{\"type\":\"string\"},\
    \"MetricUnit\":{\"type\":\"string\"},\
    \"MetricValue\":{\"type\":\"string\"},\
    \"NextToken\":{\"type\":\"string\"},\
    \"OptionalVersion\":{\"type\":\"long\"},\
    \"OutgoingCertificate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The certificate ID.</p>\"\
        },\
        \"transferredTo\":{\
          \"shape\":\"AwsAccountId\",\
          \"documentation\":\"<p>The AWS account to which the transfer was made.</p>\"\
        },\
        \"transferDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer was initiated.</p>\"\
        },\
        \"transferMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The transfer message.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The certificate creation date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A certificate that has been transfered but not yet accepted.</p>\"\
    },\
    \"OutgoingCertificates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OutgoingCertificate\"}\
    },\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"min\":1,\
      \"max\":250\
    },\
    \"PartitionKey\":{\"type\":\"string\"},\
    \"PayloadField\":{\"type\":\"string\"},\
    \"Policies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Policy\"}\
    },\
    \"Policy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyArn\":{\
          \"shape\":\"PolicyArn\",\
          \"documentation\":\"<p>The policy ARN.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an AWS IoT policy.</p>\"\
    },\
    \"PolicyArn\":{\"type\":\"string\"},\
    \"PolicyDocument\":{\"type\":\"string\"},\
    \"PolicyName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":128,\
      \"pattern\":\"[\\\\w+=,.@-]+\"\
    },\
    \"PolicyVersion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"versionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        },\
        \"isDefaultVersion\":{\
          \"shape\":\"IsDefaultVersion\",\
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\"\
        },\
        \"createDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date and time the policy was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a policy version.</p>\"\
    },\
    \"PolicyVersionId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9]+\"\
    },\
    \"PolicyVersions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PolicyVersion\"}\
    },\
    \"Principal\":{\"type\":\"string\"},\
    \"PrincipalArn\":{\"type\":\"string\"},\
    \"Principals\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PrincipalArn\"}\
    },\
    \"PrivateKey\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"PublicKey\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"PutItemInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"tableName\"],\
      \"members\":{\
        \"tableName\":{\
          \"shape\":\"TableName\",\
          \"documentation\":\"<p>The table where the message data will be written</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DynamoActionVS action that specifies the DynamoDB table to which the message data will be written.</p>\"\
    },\
    \"QueueUrl\":{\"type\":\"string\"},\
    \"RangeKeyField\":{\"type\":\"string\"},\
    \"RangeKeyValue\":{\"type\":\"string\"},\
    \"RegisterCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"caCertificate\",\
        \"verificationCertificate\"\
      ],\
      \"members\":{\
        \"caCertificate\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The CA certificate.</p>\"\
        },\
        \"verificationCertificate\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The private key verification certificate.</p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActive\",\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\",\
          \"documentation\":\"<p>A boolean value that specifies if the CA certificate is set to active.</p>\"\
        },\
        \"allowAutoRegistration\":{\
          \"shape\":\"AllowAutoRegistration\",\
          \"location\":\"querystring\",\
          \"locationName\":\"allowAutoRegistration\",\
          \"documentation\":\"<p>Allows this CA certificate to be used for auto registration of device certificates.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the RegisterCACertificate operation.</p>\"\
    },\
    \"RegisterCACertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The CA certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The CA certificate identifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the RegisterCACertificateResponse operation.</p>\"\
    },\
    \"RegisterCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificatePem\"],\
      \"members\":{\
        \"certificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\"\
        },\
        \"caCertificatePem\":{\
          \"shape\":\"CertificatePem\",\
          \"documentation\":\"<p>The CA certificate used to sign the device certificate being registered.</p>\"\
        },\
        \"setAsActive\":{\
          \"shape\":\"SetAsActiveFlag\",\
          \"deprecated\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"setAsActive\",\
          \"documentation\":\"<p>A boolean value that specifies if the CA certificate is set to active.</p>\"\
        },\
        \"status\":{\"shape\":\"CertificateStatus\"}\
      },\
      \"documentation\":\"<p>The input to the RegisterCertificate operation.</p>\"\
    },\
    \"RegisterCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"certificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The certificate ARN.</p>\"\
        },\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"documentation\":\"<p>The certificate identifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the RegisterCertificate operation.</p>\"\
    },\
    \"RegistrationCode\":{\
      \"type\":\"string\",\
      \"min\":64,\
      \"max\":64,\
      \"pattern\":\"(0x)?[a-fA-F0-9]+\"\
    },\
    \"RegistrationCodeValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>Additional information about the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true,\
      \"documentation\":\"<p>The registration code is invalid.</p>\"\
    },\
    \"RejectCertificateTransferRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"rejectReason\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The reason the certificate transfer was rejected.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the RejectCertificateTransfer operation.</p>\"\
    },\
    \"RemoveThingType\":{\"type\":\"boolean\"},\
    \"ReplaceTopicRuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ruleName\",\
        \"topicRulePayload\"\
      ],\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"location\":\"uri\",\
          \"locationName\":\"ruleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"topicRulePayload\":{\
          \"shape\":\"TopicRulePayload\",\
          \"documentation\":\"<p>The rule payload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the ReplaceTopicRule operation.</p>\",\
      \"payload\":\"topicRulePayload\"\
    },\
    \"RepublishAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"topic\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"topic\":{\
          \"shape\":\"TopicPattern\",\
          \"documentation\":\"<p>The name of the MQTT topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to republish to another topic.</p>\"\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        },\
        \"resourceId\":{\
          \"shape\":\"resourceId\",\
          \"documentation\":\"<p>The ID of the resource that caused the exception.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"resourceArn\",\
          \"documentation\":\"<p>The ARN of the resource that caused the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true,\
      \"documentation\":\"<p>The resource already exists.</p>\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true,\
      \"documentation\":\"<p>The specified resource does not exist.</p>\"\
    },\
    \"RuleArn\":{\"type\":\"string\"},\
    \"RuleName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":128,\
      \"pattern\":\"^[a-zA-Z0-9_]+$\"\
    },\
    \"S3Action\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"bucketName\",\
        \"key\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"bucketName\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The Amazon S3 bucket.</p>\"\
        },\
        \"key\":{\
          \"shape\":\"Key\",\
          \"documentation\":\"<p>The object key.</p>\"\
        },\
        \"cannedAcl\":{\
          \"shape\":\"CannedAccessControlList\",\
          \"documentation\":\"<p>The Amazon S3 canned ACL that controls access to the object identified by the object key. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl\\\">S3 canned ACLs</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to write data to an Amazon S3 bucket.</p>\"\
    },\
    \"SQL\":{\"type\":\"string\"},\
    \"SearchableAttributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeName\"}\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true,\
      \"documentation\":\"<p>The service is temporarily unavailable.</p>\"\
    },\
    \"SetAsActive\":{\"type\":\"boolean\"},\
    \"SetAsActiveFlag\":{\"type\":\"boolean\"},\
    \"SetAsDefault\":{\"type\":\"boolean\"},\
    \"SetDefaultPolicyVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyVersionId\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyName\",\
          \"documentation\":\"<p>The policy name.</p>\"\
        },\
        \"policyVersionId\":{\
          \"shape\":\"PolicyVersionId\",\
          \"location\":\"uri\",\
          \"locationName\":\"policyVersionId\",\
          \"documentation\":\"<p>The policy version ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetDefaultPolicyVersion operation.</p>\"\
    },\
    \"SetLoggingOptionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"loggingOptionsPayload\"],\
      \"members\":{\
        \"loggingOptionsPayload\":{\
          \"shape\":\"LoggingOptionsPayload\",\
          \"documentation\":\"<p>The logging options payload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the SetLoggingOptions operation.</p>\",\
      \"payload\":\"loggingOptionsPayload\"\
    },\
    \"SnsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"targetArn\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"targetArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the SNS topic.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"messageFormat\":{\
          \"shape\":\"MessageFormat\",\
          \"documentation\":\"<p>The message format of the message to publish. Optional. Accepted values are \\\"JSON\\\" and \\\"RAW\\\". The default value of the attribute is \\\"RAW\\\". SNS uses this setting to determine if the payload should be parsed and relevant platform-specific bits of the payload should be extracted. To read more about SNS message formats, see <a href=\\\"http://docs.aws.amazon.com/sns/latest/dg/json-formats.html\\\"></a> refer to their official documentation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to publish to an Amazon SNS topic.</p>\"\
    },\
    \"SqlParseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true,\
      \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\"\
    },\
    \"SqsAction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"roleArn\",\
        \"queueUrl\"\
      ],\
      \"members\":{\
        \"roleArn\":{\
          \"shape\":\"AwsArn\",\
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\"\
        },\
        \"queueUrl\":{\
          \"shape\":\"QueueUrl\",\
          \"documentation\":\"<p>The URL of the Amazon SQS queue.</p>\"\
        },\
        \"useBase64\":{\
          \"shape\":\"UseBase64\",\
          \"documentation\":\"<p>Specifies whether to use Base64 encoding.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an action to publish data to an Amazon SQS queue.</p>\"\
    },\
    \"StateReason\":{\"type\":\"string\"},\
    \"StateValue\":{\"type\":\"string\"},\
    \"StreamName\":{\"type\":\"string\"},\
    \"TableName\":{\"type\":\"string\"},\
    \"ThingArn\":{\"type\":\"string\"},\
    \"ThingAttribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type, if the thing has been associated with a type.</p>\"\
        },\
        \"attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A list of thing attributes which are name-value pairs.</p>\"\
        },\
        \"version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the thing record in the registry.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The properties of the thing, including thing name, thing type name, and a list of thing attributes.</p>\"\
    },\
    \"ThingAttributeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingAttribute\"}\
    },\
    \"ThingName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":128,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingNameList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingName\"}\
    },\
    \"ThingTypeArn\":{\"type\":\"string\"},\
    \"ThingTypeDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"thingTypeProperties\":{\
          \"shape\":\"ThingTypeProperties\",\
          \"documentation\":\"<p>The ThingTypeProperties for the thing type.</p>\"\
        },\
        \"thingTypeMetadata\":{\"shape\":\"ThingTypeMetadata\"}\
      },\
      \"documentation\":\"<p>The definition of the thing type, including thing type name and description.</p>\"\
    },\
    \"ThingTypeDescription\":{\
      \"type\":\"string\",\
      \"max\":2028,\
      \"pattern\":\"[\\\\p{Graph}\\\\x20]*\"\
    },\
    \"ThingTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ThingTypeDefinition\"}\
    },\
    \"ThingTypeMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deprecated\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether the thing type is deprecated. If <b>true</b>, no new things could be associated with this type.</p>\"\
        },\
        \"deprecationDate\":{\
          \"shape\":\"DeprecationDate\",\
          \"documentation\":\"<p>The date and time when the thing type was deprecated.</p>\"\
        },\
        \"creationDate\":{\
          \"shape\":\"CreationDate\",\
          \"documentation\":\"<p>The date and time when the thing type was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>\"\
    },\
    \"ThingTypeName\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"max\":128,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingTypeProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"thingTypeDescription\":{\
          \"shape\":\"ThingTypeDescription\",\
          \"documentation\":\"<p>The description of the thing type.</p>\"\
        },\
        \"searchableAttributes\":{\
          \"shape\":\"SearchableAttributes\",\
          \"documentation\":\"<p>A list of searchable thing attribute names.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The ThingTypeProperties contains information about the thing type including: a thing type description, and a list of searchable thing attribute names.</p>\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true,\
      \"documentation\":\"<p>The rate exceeds the limit.</p>\"\
    },\
    \"Topic\":{\"type\":\"string\"},\
    \"TopicPattern\":{\"type\":\"string\"},\
    \"TopicRule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"sql\":{\
          \"shape\":\"SQL\",\
          \"documentation\":\"<p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the rule.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"CreatedAtDate\",\
          \"documentation\":\"<p>The date and time the rule was created.</p>\"\
        },\
        \"actions\":{\
          \"shape\":\"ActionList\",\
          \"documentation\":\"<p>The actions associated with the rule.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        },\
        \"awsIotSqlVersion\":{\
          \"shape\":\"AwsIotSqlVersion\",\
          \"documentation\":\"<p>The version of the SQL rules engine to use when evaluating the rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a rule.</p>\"\
    },\
    \"TopicRuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicRuleListItem\"}\
    },\
    \"TopicRuleListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ruleArn\":{\
          \"shape\":\"RuleArn\",\
          \"documentation\":\"<p>The rule ARN.</p>\"\
        },\
        \"ruleName\":{\
          \"shape\":\"RuleName\",\
          \"documentation\":\"<p>The name of the rule.</p>\"\
        },\
        \"topicPattern\":{\
          \"shape\":\"TopicPattern\",\
          \"documentation\":\"<p>The pattern for the topic names that apply.</p>\"\
        },\
        \"createdAt\":{\
          \"shape\":\"CreatedAtDate\",\
          \"documentation\":\"<p>The date and time the rule was created.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a rule.</p>\"\
    },\
    \"TopicRulePayload\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"sql\",\
        \"actions\"\
      ],\
      \"members\":{\
        \"sql\":{\
          \"shape\":\"SQL\",\
          \"documentation\":\"<p>The SQL statement used to query the topic. For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/iot-rules.html#aws-iot-sql-reference\\\">AWS IoT SQL Reference</a> in the <i>AWS IoT Developer Guide</i>.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the rule.</p>\"\
        },\
        \"actions\":{\
          \"shape\":\"ActionList\",\
          \"documentation\":\"<p>The actions associated with the rule.</p>\"\
        },\
        \"ruleDisabled\":{\
          \"shape\":\"IsDisabled\",\
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\"\
        },\
        \"awsIotSqlVersion\":{\
          \"shape\":\"AwsIotSqlVersion\",\
          \"documentation\":\"<p>The version of the SQL rules engine to use when evaluating the rule.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a rule.</p>\"\
    },\
    \"TransferAlreadyCompletedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true,\
      \"documentation\":\"<p>You can't revert the certificate transfer because the transfer is already complete.</p>\"\
    },\
    \"TransferCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"certificateId\",\
        \"targetAwsAccount\"\
      ],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"targetAwsAccount\":{\
          \"shape\":\"AwsAccountId\",\
          \"location\":\"querystring\",\
          \"locationName\":\"targetAwsAccount\",\
          \"documentation\":\"<p>The AWS account.</p>\"\
        },\
        \"transferMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The transfer message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the TransferCertificate operation.</p>\"\
    },\
    \"TransferCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"transferredCertificateArn\":{\
          \"shape\":\"CertificateArn\",\
          \"documentation\":\"<p>The ARN of the certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the TransferCertificate operation.</p>\"\
    },\
    \"TransferConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true,\
      \"documentation\":\"<p>You can't transfer the certificate because authorization policies are still attached.</p>\"\
    },\
    \"TransferData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"transferMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The transfer message.</p>\"\
        },\
        \"rejectReason\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The reason why the transfer was rejected.</p>\"\
        },\
        \"transferDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer took place.</p>\"\
        },\
        \"acceptDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer was accepted.</p>\"\
        },\
        \"rejectDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the transfer was rejected.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Data used to transfer a certificate to an AWS account.</p>\"\
    },\
    \"UnauthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true,\
      \"documentation\":\"<p>You are not authorized to perform this operation.</p>\"\
    },\
    \"UndoDeprecate\":{\"type\":\"boolean\"},\
    \"UpdateCACertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"certificateId\"],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"caCertificateId\",\
          \"documentation\":\"<p>The CA certificate identifier.</p>\"\
        },\
        \"newStatus\":{\
          \"shape\":\"CACertificateStatus\",\
          \"location\":\"querystring\",\
          \"locationName\":\"newStatus\",\
          \"documentation\":\"<p>The updated status of the CA certificate.</p> <p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\"\
        },\
        \"newAutoRegistrationStatus\":{\
          \"shape\":\"AutoRegistrationStatus\",\
          \"location\":\"querystring\",\
          \"locationName\":\"newAutoRegistrationStatus\",\
          \"documentation\":\"<p>The new value for the auto registration status. Valid values are: \\\"ENABLE\\\" or \\\"DISABLE\\\".</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input to the UpdateCACertificate operation.</p>\"\
    },\
    \"UpdateCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"certificateId\",\
        \"newStatus\"\
      ],\
      \"members\":{\
        \"certificateId\":{\
          \"shape\":\"CertificateId\",\
          \"location\":\"uri\",\
          \"locationName\":\"certificateId\",\
          \"documentation\":\"<p>The ID of the certificate.</p>\"\
        },\
        \"newStatus\":{\
          \"shape\":\"CertificateStatus\",\
          \"location\":\"querystring\",\
          \"locationName\":\"newStatus\",\
          \"documentation\":\"<p>The new status.</p> <p><b>Note:</b> Setting the status to PENDING_TRANSFER will result in an exception being thrown. PENDING_TRANSFER is a status used internally by AWS IoT. It is not intended for developer use.</p> <p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the UpdateCertificate operation.</p>\"\
    },\
    \"UpdateThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\",\
          \"documentation\":\"<p>The name of the thing to update.</p>\"\
        },\
        \"thingTypeName\":{\
          \"shape\":\"ThingTypeName\",\
          \"documentation\":\"<p>The name of the thing type.</p>\"\
        },\
        \"attributePayload\":{\
          \"shape\":\"AttributePayload\",\
          \"documentation\":\"<p>A list of thing attributes, a JSON string containing name-value pairs. For example:</p> <p><code>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"name1\\\\\\\":\\\\\\\"value2\\\\\\\"}})</code></p> <p>This data is used to add new attributes or update existing attributes.</p>\"\
        },\
        \"expectedVersion\":{\
          \"shape\":\"OptionalVersion\",\
          \"documentation\":\"<p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>UpdateThing</code> request is rejected with a <code>VersionConflictException</code>.</p>\"\
        },\
        \"removeThingType\":{\
          \"shape\":\"RemoveThingType\",\
          \"documentation\":\"<p>Remove a thing type association. If <b>true</b>, the assocation is removed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the UpdateThing operation.</p>\"\
    },\
    \"UpdateThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The output from the UpdateThing operation.</p>\"\
    },\
    \"UseBase64\":{\"type\":\"boolean\"},\
    \"Version\":{\"type\":\"long\"},\
    \"VersionConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true,\
      \"documentation\":\"<p>An exception thrown when the version of a thing passed to a command is different than the version specified with the --version parameter. </p>\"\
    },\
    \"VersionsLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true,\
      \"documentation\":\"<p>The number of policy versions exceeds the limit.</p>\"\
    },\
    \"errorMessage\":{\"type\":\"string\"},\
    \"resourceArn\":{\"type\":\"string\"},\
    \"resourceId\":{\"type\":\"string\"}\
  },\
  \"examples\":{\
  }\
}";
}

@end
